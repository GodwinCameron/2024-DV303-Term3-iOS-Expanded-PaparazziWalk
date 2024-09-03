//
//  CelebListScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/29.
//

import SwiftUI

struct CelebListScreen: View {
    
    let celebrities: [Celebrity] = celebData
    
    var body: some View {
        ScrollView {
                    VStack {
                        ForEach(celebrities) { celeb in
                            NavigationLink(destination: CelebScreen(celeb: celeb)) {
                                HStack{
                                    Text(celeb.name)
                                    Spacer()
                                    Image(systemName:"chevron.right.circle")
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                }
                                .foregroundColor(.black)
                                .frame(width: 270, height: 20)
                                .padding(7)
                                .background(Color("Body"))
                                
                            }
                        }
                    }
                }
    }
}

#Preview {
    CelebListScreen()
}
