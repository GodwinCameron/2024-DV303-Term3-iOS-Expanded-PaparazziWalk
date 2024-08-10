//
//  CelebScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct CelebScreen: View {
    var body: some View {
        ZStack{
            Image("Ari")
            VStack{
                Spacer()
                    .frame(height: 300)
                ZStack{
                    VStack{
                        Spacer()
                            .frame(height:5)
                        Text("Ariana Grande")
                            .font(.custom("Outfit-Bold", size: 25))
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("Walks ") +
                        Text("10,000 - 12,000 ").font(.custom("Outfit-Bold", size: 15)) +
                        Text("Steps")
                        Text("a day on average.")
                        
                        Spacer()
                            .frame(height: 10)
                        
                        Text("Walked ") +
                        Text("9,684 ").font(.custom("Outfit-Bold", size: 15)) +
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
                                Image(systemName: "paperplane")
                                    .foregroundStyle(Color(.white))
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

#Preview {
    CelebScreen()
}
