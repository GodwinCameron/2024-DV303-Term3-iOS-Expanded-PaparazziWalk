//
//  FirebaseAuthManager.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/16.
//

import Foundation

class FirebaseAutManager : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    
    @Published var isAuthenticated : Bool = false
    @Published var errorMessage = ""
    
    func login() {
        self.errorMessage = ""
        
    }
}
