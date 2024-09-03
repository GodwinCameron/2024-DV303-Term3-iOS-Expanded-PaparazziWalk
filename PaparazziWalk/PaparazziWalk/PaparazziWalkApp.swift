//
//  PaparazziWalkApp.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/07/26.
//



import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct PaparazziWalkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)  var delegate
    @State var Onboarded: Bool = UserDefaults.standard.bool(forKey: "Onboarded") ///This new state is called from the userdefautls so that I can have a persistent onboarded state trhoughout app launches.
    
    ///I really wanted to add in an Auth init to check if a valid login session existed so that the user doesn't have to sign in each time they launch the app, although it kept executing before firebase could finish configuring. I couldn't really find a solution so I asked ChatGPT and it suggested that I use a lazy initialization of the the auth manager and that's what's going on below. So far it seems to be working as intended and now the user doesn't have to sign in each time.
// CODE BY CHATGPT: ==============================================================================
    // Use lazy initialization to avoid instantiating FirebaseAuthManager too early
        @StateObject private var firebaseAuthManager: FirebaseAuthManager = {
            let manager = FirebaseAuthManager()
            // Ensure Firebase is configured before checking auth state
            manager.isAuthenticated = Auth.auth().currentUser != nil
            return manager
        }()
//    ============================================================================================
    
    var body: some Scene {
        
        WindowGroup {
                    if !Onboarded {
                        NavigationStack {
                            OnboardingOne(Onboarded: $Onboarded)
                        }
                    } else {
                        if firebaseAuthManager.isAuthenticated {
                            ContentView()
                                .environmentObject(firebaseAuthManager)
                        } else {
                            AuthScreen(firebaseAuthManager: firebaseAuthManager)
                                .environmentObject(firebaseAuthManager)
                        }
                    }
                
                }
                ///This manages the changes of userdefaults of the onbaorded state.
                .onChange(of: Onboarded) { newValue in
                            UserDefaults.standard.set(newValue, forKey: "Onboarded")
                        }
    }
}



