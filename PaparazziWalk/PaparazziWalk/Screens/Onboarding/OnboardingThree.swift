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
                    Button(action: {Onboarded = true}, label: {
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
