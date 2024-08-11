//
//  CheckInItem.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct CheckInItem : Identifiable {
    
    var id = UUID()
    var docId : String? //Firestore document id for updating and getting.
    var title : String
    var description : String
    var isComplete : Bool
}
