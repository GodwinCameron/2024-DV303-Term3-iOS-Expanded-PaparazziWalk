//
//  HealthView.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/07/26.
//

import SwiftUI

struct HealthView: View {
    
    @ObservedObject var manager = HealthManager()
    
    var body: some View {
        VStack
        {
            ForEach(manager.healthStats){ stat in
                Image(systemName: stat.image)
                Text(stat.title)
                Text(stat.amount).foregroundColor(stat.color)
                Spacer()
            }
        }.padding() //Main parent VStack
    }
}

#Preview {
    HealthView()
}
