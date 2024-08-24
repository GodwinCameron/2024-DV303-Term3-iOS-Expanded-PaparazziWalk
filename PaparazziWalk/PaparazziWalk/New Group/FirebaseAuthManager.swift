//
//  FirebaseAuthManager.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/16.
//

import Foundation
import FirebaseAuth


class FirebaseAuthManager : ObservableObject {
    
    
    @Published var email : String = ""
    @Published var password : String = ""
    
    @Published var isAuthenticated : Bool = false
    @Published var errorMessage = ""
    
    
    
    init() { //<-- this init function will run on startup (kinda like react's useeffect)
//        onec it runs, it will check if an authentciated session exists so that they user doesn't need to sign in everytime, much like we did in AndroidExpanded.
            self.isAuthenticated = Auth.auth().currentUser != nil
        }
    
    // Using a logout method here because the init will check if a user has a valid session meaning they will never logout unless we use this.
    func logout() {
        self.errorMessage = ""
        
        do {
            try Auth.auth().signOut()
            self.isAuthenticated = false
            print("User successfully signed out.")
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
            self.errorMessage = signOutError.localizedDescription
        }
    }
    
    func login() {
        self.errorMessage = ""
        Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
            if error != nil {
                print(error!.localizedDescription)
                self.errorMessage = error!.localizedDescription
                return
            }
            if authResult != nil {
                self.isAuthenticated = true
                print("Logged in User: \(authResult!.user.uid)")
            }
        }
    }
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            if error != nil {
                print(error!.localizedDescription)
                self.errorMessage = error!.localizedDescription
                return
            }
            if authResult != nil {
                self.isAuthenticated = true
                print("Successfully created User: \(authResult!.user.uid)")
            }
        }
    }
}
