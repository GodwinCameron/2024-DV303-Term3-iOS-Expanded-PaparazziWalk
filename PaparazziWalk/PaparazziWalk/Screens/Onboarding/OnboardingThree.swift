//
//  OnboardingThree.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/11.
//

import SwiftUI

struct OnboardingThree: View {
    
    @Binding var Onboarded : Bool
    
    var body: some View {
        VStack{
            Spacer()
            Text("Keep track of your goals and see which celebrities you were able to beat!")
                .font(.custom("Outfit-Thin", size:15))
                .padding(40)
            Text("*Please note* If you haven't seen/accepted it already, this app utilizes your personal HealthKit data (primarily steps). Please be aware that you will be granting this app access to your fitness data.")
                .font(.custom("Outfit-Thin", size:9))
                .padding(40)
            Spacer()
                .frame(height: 20)
            Image(systemName: "shoeprints.fill")
                .resizable()
                .frame(width: 60, height: 80)
                .foregroundStyle(Color("Primary"))
            Spacer()
            VStack{
                HStack{
                    Image(systemName: "dot.square")
                        .foregroundStyle(Color("Secondary"))
                    Image(systemName: "dot.square")
                        .foregroundStyle(Color("Secondary"))
                    Image(systemName: "dot.square.fill")
                        .foregroundStyle(Color("Primary"))
                }
                HStack{
                    Spacer()
                    Button(action: {
                        Onboarded = true
                        ///Adding this here so that when the final onboarding screen button is tapped, it can set the persistent data in userdefaults.
                        UserDefaults.standard.set(true, forKey: "Onboarded")
                    }, label: {
                        Text("Get Started! ->")
                            .foregroundStyle(Color("Tertiary"))
                    })
                    .padding(50)
                }
            }
        }
    }
}

//#Preview {
//    OnboardingThree()
//}
