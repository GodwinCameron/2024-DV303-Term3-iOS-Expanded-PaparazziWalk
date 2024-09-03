//
//  CelebScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct CelebScreen: View {
    
    
    let celeb: Celebrity
    
    var body: some View {
        ZStack{
            Image(celeb.image)
            VStack{
                Spacer()
                    .frame(height: 300)
                ZStack{
                    VStack{
                        Spacer()
                            .frame(height:5)
                        Text(celeb.name)
                            .font(.custom("Outfit-Bold", size: 25))
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("Walks ") +
                        Text("\(celeb.dailyStepsRange) ").font(.custom("Outfit-Bold", size: 15)) +
                        Text("Steps")
                        Text("a day on average.")
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("Walked ") +
                        Text("\(celeb.todaySteps) ").font(.custom("Outfit-Bold", size: 15)) +
                        Text("Steps today.")
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("Start tracking goal!")
                            .font(.custom("Outfit-Regular", size: 10))
                        Spacer()
                    }
                    .font(.custom("Outfit-Thin", size: 15))
                    .frame(width:300, height: 160)
                    .background(Color(.white))
                    .cornerRadius(8)
                    
                    
                    
                    VStack{
                        Spacer()
                            .frame(height:160)
                        ZStack{
                            ZStack{
                                Button(action: {
                                    let newCeleb = Celebrity(name: celeb.name, image: celeb.image, dailyStepsRange: celeb.dailyStepsRange, todaySteps: celeb.todaySteps)
                                    saveTargetCeleb(newCeleb)
                                }, label: {
                                    Image(systemName: "paperplane")
                                        .foregroundStyle(Color(.white))
                                })
                                
                            }
                            .frame(width:40, height:40)
                            .background(Color("Primary"))
                            .cornerRadius(50)
                        }
                        .frame(width: 50, height: 50)
                        .background(Color(.white))
                        .cornerRadius(50)
                    }
                }
            }
            
            
            
            
            
        }
        .ignoresSafeArea()
    }
}


///Base code provided by ChatGPT, altered slightly to suit my more specific usecase:============
func saveTargetCeleb(_ celeb: Celebrity) {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(celeb)
        UserDefaults.standard.set(data, forKey: "TargetCeleb")
    } catch {
        print("Failed to encode celebrity: \(error)")
    }
}
///======================================================================

//#Preview {
//    CelebScreen()
//}
