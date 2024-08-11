//
//  OnboardingTwo.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/11.
//

import SwiftUI

struct OnboardingTwo: View {
    
    @Binding var Onboarded : Bool
    
    var body: some View {
        VStack{
            Spacer()
                
            Text("Keep up with your favorite Celebrities' health habits and try to match (or beat) them!")
                .font(.custom("Outfit-Thin", size:15))
                .padding(40)
            
            Spacer()
                .frame(height: 20)
            Image(systemName: "person.3.fill")
                .resizable()
                .frame(width: 150, height: 80)
                .foregroundStyle(Color("Primary"))
            Spacer()
            VStack{
                HStack{
                    Image(systemName: "dot.square")
                        .foregroundStyle(Color("Secondary"))
                    Image(systemName: "dot.square.fill")
                        .foregroundStyle(Color("Primary"))
                    Image(systemName: "dot.square")
                        .foregroundStyle(Color("Primary"))
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: OnboardingThree(Onboarded: $Onboarded)){
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
//    OnboardingTwo()
//}
