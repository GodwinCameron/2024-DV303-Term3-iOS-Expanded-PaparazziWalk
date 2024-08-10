//
//  ContentView.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/07/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var Authorised : Bool = false
    
    var body: some View {
        
        if(!Authorised) {
            AuthScreen(Authorised: $Authorised)
        } else {
            NavigationStack{
                DashScreen()
            }
        }
    }
}

#Preview {
    ContentView()
}
