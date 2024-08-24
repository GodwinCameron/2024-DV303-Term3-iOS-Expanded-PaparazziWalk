//
//  ProfileScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var firebaseAuthManager = FirebaseAuthManager()
    @State private var showAuthScreen = false
    
    var body: some View {
        
        if !showAuthScreen{
            
            Text("Profile Screen.")
            Button(action: {
                firebaseAuthManager.logout()
                showAuthScreen = true
            }){
                Text("Logout")
            }
        } else {
            AuthScreen(firebaseAuthManager: firebaseAuthManager)
        }
    }
    
    
}

#Preview {
    ProfileScreen()
}
