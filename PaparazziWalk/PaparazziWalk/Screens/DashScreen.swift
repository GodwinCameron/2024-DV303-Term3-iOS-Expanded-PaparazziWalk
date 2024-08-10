//
//  DashScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct DashScreen: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "list.dash.header.rectangle")
                Text("My Dashboard")
            }
            .foregroundColor(Color("Primary"))
        }
        ZStack{
            VStack{
                Spacer()
                    .frame(height: 10)
                VStack{
                    HStack{
                        Text("Your steps today")
                            .font(.system(size: 9))
                            .foregroundStyle(Color("Primary"))
                            .padding()
                        Spacer()
                        
                    }
                    Text("2,839")
                        .font(.system(size: 20))
                        .foregroundStyle(Color("Primary"))
                    Text("Steps")
                        .font(.system(size: 9))
                        .foregroundStyle(Color("Primary"))
                    VStack{
                        HStack{
                            Text("34% of your target")
                            Spacer()
                                .frame(width: 175)
                            
                        }
                        Text("Brad Pitt ").font(.custom("Outfit-Bold", size: 12)) +
                        Text("walked ") +
                        Text("4,245 ").font(.custom("Outfit-Bold", size: 12)) +
                        Text("more steps than you today")
                    }
                    .font(.system(size: 12))
                    .padding()
                    
                    Button(action: {}, label: {
                        Text("Change Target")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding( .vertical, 10)
                            .background(Color("Primary"))
                            .cornerRadius(50)
                    })
                }
                .frame(width: 392, height: 230)
                
                .background(Color(.white))
                .cornerRadius(8)
                Spacer()
                    .frame(height:10)
                VStack{
                    VStack{
                        HStack{
                            Text("Steps this week:")
                                .font(.custom("Outfit-Thin", size: 18))
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                    
                }
                .frame(width: 392, height: 200)
                
                .background(Color(.white))
                .cornerRadius(8)
                Spacer()
                    .frame(height:10)
                HStack{
                    NavigationLink(destination: ProfileScreen()) {
                        VStack{
                            Text("Profile and Stats")
                                .font(.custom("Outfit-Thin", size: 18))
                                .foregroundStyle(Color(.black))
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color("Primary"))
                            Text("See your stats and progress")
                                .font(.custom("Outfit-Thin", size: 12))
                                .foregroundStyle(Color(.black))
                            }
                            .frame(width: 200, height: 200)
                            .background(Color(.white))
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: CelebScreen()) {
                        VStack{
                            Text("Celebrities")
                                .font(.custom("Outfit-Thin", size: 18))
                                .foregroundStyle(Color(.black))
                            Image(systemName: "person.2.crop.square.stack")
                                .resizable()
                                .frame(width: 80, height: 90)
                                .foregroundColor(Color("Primary"))
                            Text("Browse other celebrities and their walking habits")
                                .font(.custom("Outfit-Thin", size: 12))
                                .foregroundStyle(Color(.black))
                            }
                            .frame(width: 200, height: 200)
                            .background(Color(.white))
                            .cornerRadius(8)
                    }
                    
                    
                }
                Spacer()
                
            }
            .font(.custom("Outfit-Regular", size:20))
            
        }
        .frame(width: 450, height: 700)
        .background(Color("Body"))
        Spacer()
        
    }
}

#Preview {
    DashScreen()
}
