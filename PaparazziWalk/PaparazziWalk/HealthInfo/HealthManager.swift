//
//  HealthManager.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/07/26.
//

import Foundation



// ============================================================ CLASS CODE BELOW:
import HealthKit
import WidgetKit

class HealthManager : ObservableObject
{
    
    
    //TODO: 1. setup variables
    let healthStore = HKHealthStore()
    
    //This variable will be used to display the health data in the frontend.
    @Published var healthStats : [HealthStat] = []
    
    //runs when the healthmanager is launched.
    init()
    {
        print("*NEW* Initiated successfully")
        authoriseHealthAccess()
        
    }
    
    //TODO: 2. check if we do have authority to access the health data
    func authoriseHealthAccess()
    {
        //checks to see if access to data is available
        if HKHealthStore.isHealthDataAvailable()
        {
            //This array specifices all the sensor data we want to retrieve.
            let dataTypes : Set =
            [
                HKQuantityType(.stepCount),
                HKQuantityType(.heartRate),
                HKQuantityType(.activeEnergyBurned)
            ]
            
            Task
            {
                do
                {
                    try await healthStore.requestAuthorization(toShare: [], read: dataTypes)
                    
                    print("Access Granted to HealthKit sensor data")
                    
                    //START ACCESSING OUR DATA
                    getStepCounts()
                }
                catch
                {
                    print("Error handling HealthKit Access.")
                }
            }
        }
    }
    
    //TODO: 3. retrieve data
    
    func getStepCounts()
    {
        // this variable specifies what data we want
        let steps = HKQuantityType(.stepCount)
        //timeframe - predicate
        let predicate = HKQuery
            .predicateForSamples(withStart: //Select starting date for timeframe
                                    Calendar.current.startOfDay(for:
                                                                    Date()),
                                 end:      //Select ending date for timeframe
                                    Date())
        
        
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate)
        {
            _,
            result,
            error in
            
            //handling errors when the get fails
            guard let quantity = result?.sumQuantity(), error == nil
                    else
            {
                print("Error getting step counts: \(error?.localizedDescription)")
                return
            }
            
            //the actaul number value ascosiated with step count
            let stepCountValue = quantity.doubleValue(for: .count())
            
            self.updateWidget(newSteps: stepCountValue)
            
            DispatchQueue.main.async
            {
                self.healthStats.append(HealthStat(
                                         title: "Total Steps",
                                         amount: "\(stepCountValue.rounded(.towardZero))",
                                         image: "figure.walk.circle",
                                         color: .green
                ))
                print("*NEW* Steps: \(stepCountValue)")
            }
            
        }
        healthStore.execute(query)
    }
    
    func updateWidget(newSteps: Double)
    {
       let defaults = UserDefaults(suiteName: "group.co.za.openwindow.PaparazziWalk") //<-- points to group
        defaults?.set(newSteps, forKey: "totalSteps")
        
        //to trigger refresh of widget:
        WidgetCenter.shared.reloadAllTimelines()
    }
    
}
// ============================================================ END OF CLASS CODE
