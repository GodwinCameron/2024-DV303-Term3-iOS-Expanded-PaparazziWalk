//
//  ContentView.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var Onboarded : Bool = false
    @State var Authorised : Bool = false
    
    var body: some View {
        
        if(!Onboarded)
        {
            NavigationStack{
                OnboardingOne(Onboarded: $Onboarded)
            }
        } else {
            if(!Authorised) {
                AuthScreen(Authorised: $Authorised)
            } else {
                NavigationStack{
                    DashScreen()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
