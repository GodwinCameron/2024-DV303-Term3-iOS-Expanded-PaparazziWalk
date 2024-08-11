//
//  AddCheckInView.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct AddCheckInView: View {
    
    @State var title = ""
    @State var description = ""
    
    var body: some View {
        VStack{
            Text("Check in view")
            
            TextField("Title", text: $title, prompt: Text("Check in Title"))
            TextField("Description", text: $description, prompt: Text("Check in Description"))
            
            Button(action: {}) {
                Text("Check in")
            }
        }
        
    }
}

#Preview {
    AddCheckInView()
}
