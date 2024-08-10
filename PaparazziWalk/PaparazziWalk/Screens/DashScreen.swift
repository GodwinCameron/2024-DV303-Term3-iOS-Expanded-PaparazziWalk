//
//  DashScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct DashScreen: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "list.dash.header.rectangle")
                Text("My Dashboard")
            }
            .foregroundColor(Color("Primary"))
        }
        ZStack{
            VStack{
                Spacer()
                    .frame(height: 10)
                VStack{
                    HStack{
                        Text("Your steps today")
                            .font(.custom("Outfit-Regular", size:9))
                            .foregroundStyle(Color("Primary"))
                        Spacer()
                    }
                }
                .frame(width: 392, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                .background(Color(.white))
                .cornerRadius(8)
                Spacer()
            }
            
        }
        .frame(width: 450, height: 700)
        .background(Color("Body"))
        Spacer()
        
    }
}

#Preview {
    DashScreen()
}
