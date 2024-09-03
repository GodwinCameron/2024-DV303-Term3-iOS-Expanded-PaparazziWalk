//
//  ContentView.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/07/26.
//

import SwiftUI

struct ContentView: View {
    

    /// Provided by ChatGPT: =========================================================
    /// a lot of this was pretty difficult for me to grasp, with chat's help I think i understand it enough to explain it like this:
    /// A state variable is declared and it is of type "Celebrity", which i defined in my celebdata file. That variable is then checked to see
    /// if it can be set as a userdefault (presistent data between app launches), if not there's some error handling. - this will become important
    /// later when it comes to changing the target later for the user.
    /// The JSONDecoder is being used to allow the data to be stored as an object which will help when serializing and accessing it later.
//    @State var TargetCeleb: Celebrity? = {
//        if let data = UserDefaults.standard.data(forKey: "TargetCeleb") {
//            do {
//                let decoder = JSONDecoder()
//                return try decoder.decode(Celebrity.self, from: data)
//            } catch {
//                print("Failed to decode celebrity: \(error)")
//                return nil
//            }
//        }
//        return nil
//    }()
    ///=======================================================================
    
    
    
    var body: some View {
        
        NavigationStack{
            DashScreen()
        }
    }
}

//#Preview {
//    ContentView()
//}
