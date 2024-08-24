//
//  AuthScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct AuthScreen: View {
    

//    @ObservedObject var firebaseAuthManager = FirebaseAuthManager() <-- this is for when the auth is called firectly from the file 'hense the "()" '
    @ObservedObject var firebaseAuthManager: FirebaseAuthManager //<-- this is using the state object we made in content view and passed down here. This makes sure they are using the same state so that
    
    @State var email : String = ""
    @State var password : String = ""
    @State var repeatPassword : String = ""
    
    @State var RegisterMethod : Bool = false

    @State var loggedIn : Bool = false
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 30)
            Text("Welcome to")
                .font(.custom("Outfit-Thin", size:20))
            Text("PaparazziWalk!")
                    .foregroundStyle(Color("Primary"))
                    .font(.custom("Outfit-Regular", size: 24))
                    .underline()
            
                
            
            
            Spacer()
                .frame(height: 80)
            
            Text("Please Authenticate yourself with one of the following options...")
                .font(.custom("Outfit-Regular", size:9))
                .foregroundStyle(Color(.gray))
                .padding()
            
            
            if(!RegisterMethod){
                VStack{
                    HStack{
                        Text("Login:")
                            .foregroundStyle(Color("Primary"))
                            .font(.custom("Outfit-Thin", size: 24))
                            .padding(.horizontal, 15)
                        Spacer()
                    }
                    
                    
                    TextField("Email", text: $firebaseAuthManager.email)
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color("GreyField"))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                    TextField("Password", text: $firebaseAuthManager.password)
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color("GreyField"))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                        .frame(height: 50)
                    
//                    NavigationLink(destination: DashScreen()) {
//                        Text("Login")
//                    }
//                    Button(action: {Authorised = true}, label: {
//                        Text("Login")
//                    })
                    Button(action: {firebaseAuthManager.login()}, label: {
                        Text("Login")
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 107)
                    .padding( .vertical, 10)
                    .background(Color("Primary"))
                    .cornerRadius(8)
                    
                    Spacer().frame(height: 40)
                    
                    Text("Don't have an account yet?")
                        .font(.custom("Outfit-Regular", size:9))
                        .foregroundStyle(Color(.gray))
                    
                    
                    Button(action: {RegisterMethod = !RegisterMethod}, label: {
                        Text("Register Account")
                            .font(.custom("Outfit-Thin", size:18))
                            .foregroundStyle(Color("Primary"))
                            .underline()
                    })
                    
                    
                    
                }
                .frame(width: 290)
            } else {
                VStack{
                    HStack{
                        Text("Register:")
                            .foregroundStyle(Color("Primary"))
                            .font(.custom("Outfit-Thin", size: 24))
                            .padding(.horizontal, 15)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 15)
                    
                    HStack{
                        Text("Create account information:")
                            .font(.custom("Outfit-Regular", size:9))
                            .foregroundStyle(Color(.gray))
                            .padding(.horizontal, 15)
                        Spacer()
                        
                    }
                    TextField("Email", text: $firebaseAuthManager.email)
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color("GreyField"))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                    TextField("New Password", text: $firebaseAuthManager.password)
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color("GreyField"))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                    TextField("Repeat Password", text: $repeatPassword)
                        .foregroundColor(.gray)
                        .padding(10)
                        .background(Color("GreyField"))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                        .frame(height: 50)
                    
//                    NavigationLink(destination: DashScreen()) {
//                        Text("Register")
//                    }
                    
                    if(firebaseAuthManager.email != "" && firebaseAuthManager.password != ""){
                        if(firebaseAuthManager.password != repeatPassword){
                            Text("Passwords do not match")
                        } else {
                            Button(action: {firebaseAuthManager.signup()}, label: {
                                Text("Register")
                            })
                            .foregroundColor(.white)
                            .padding(.horizontal, 95)
                            .padding( .vertical, 10)
                            .background(Color("Primary"))
                            .cornerRadius(8)
                        }
                    } else {
                        Text("Please fill in all fields")
                    }
                    
                    
                    
                    Spacer().frame(height: 40)
                    
                    Text("Already have an account?")
                        .font(.custom("Outfit-Regular", size:9))
                        .foregroundStyle(Color(.gray))
                    
                    
                    Button(action: {RegisterMethod = !RegisterMethod}, label: {
                        Text("Login")
                            .font(.custom("Outfit-Thin", size:18))
                            .foregroundStyle(Color("Primary"))
                            .underline()
                    })
                    
                    
                    
                }
                .frame(width: 290)
            }
            
            Spacer()
            
            Text("Biometric login:")
                .font(.custom("Outfit-Thin", size:18))
                .foregroundStyle(Color("Primary"))
            HStack{
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("Primary"))
                Text("/")
                    .foregroundStyle(Color("Primary"))
                    .padding(.horizontal, 20)
                Image(systemName: "touchid")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("Primary"))
            }
            
            Spacer()            
        }
    }
}

//#Preview {
//    AuthScreen()
//}
