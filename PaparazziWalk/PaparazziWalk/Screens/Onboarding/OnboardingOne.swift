//
//  OnboardingOne.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/11.
//

import SwiftUI

struct OnboardingOne: View {
    
    @Binding var Onboarded : Bool
    
    var body: some View {
        VStack{
            Spacer()
                
            Text("Welcome to")
                .font(.custom("Outfit-Thin", size:20))
            Text("PaparazziWalk!")
                    .foregroundStyle(Color("Primary"))
                    .font(.custom("Outfit-Regular", size: 24))
                    .underline()
            Spacer()
                .frame(height: 20)
            Image(systemName: "figure.walk.motion")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color("Primary"))
            Spacer()
            VStack{
                HStack{
                    Image(systemName: "dot.square.fill")
                        .foregroundStyle(Color("Primary"))
                    Image(systemName: "dot.square")
                        .foregroundStyle(Color("Primary"))
                    Image(systemName: "dot.square")
                        .foregroundStyle(Color("Primary"))
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: OnboardingTwo(Onboarded: $Onboarded)){
                        Text("Next ->")
                            .foregroundStyle(Color("Tertiary"))
                    }
                    .padding(50)
                }
            }
        }
    }
}

//#Preview {
//    OnboardingOne()
//}
