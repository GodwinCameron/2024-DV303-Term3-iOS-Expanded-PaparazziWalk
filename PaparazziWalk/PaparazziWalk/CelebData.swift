//
//  CelebData.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/29.
//

import SwiftUI

///ChatGPT helped me make this object "Codable" so that it can be stored/serialized and deserialzed as needed for userdefaults.
struct Celebrity: Identifiable, Codable
{
    let id = UUID()
    let name: String
    let image: String
    let dailyStepsRange: String
    let todaySteps: Int
}


let celebData = [
    Celebrity(name: "Ariana Grande", image: "Ari", dailyStepsRange: "10,000 - 12,000", todaySteps: 9684),
    Celebrity(name: "Robert Downey Jr.", image: "Tony", dailyStepsRange: "12,000 - 14,000", todaySteps: 11203),
    Celebrity(name: "Will Smith", image: "Will", dailyStepsRange: "10,000 - 16,000", todaySteps: 13466),
    Celebrity(name: "Scarlett Johansson", image: "Scar", dailyStepsRange: "9,000 - 13,000", todaySteps: 8203),
    Celebrity(name: "Dwayne Johnson", image: "Rock", dailyStepsRange: "15,000 - 18,000", todaySteps: 16002),
    Celebrity(name: "Taylor Swift", image: "Tay", dailyStepsRange: "8,000 - 10,000", todaySteps: 9531),
    Celebrity(name: "Chris Hemsworth", image: "Chem", dailyStepsRange: "12,000 - 15,000", todaySteps: 12978),
    Celebrity(name: "Jennifer Lawrence", image: "Jen", dailyStepsRange: "9,500 - 12,500", todaySteps: 10234),
    Celebrity(name: "Chris Evans", image: "Cev", dailyStepsRange: "11,000 - 14,000", todaySteps: 11890),
    Celebrity(name: "Zendaya", image: "Zen", dailyStepsRange: "8,500 - 10,500", todaySteps: 8792),
    Celebrity(name: "Gal Gadot", image: "Gal", dailyStepsRange: "12,500 - 15,000", todaySteps: 13984),
    Celebrity(name: "Tom Holland", image: "Tomh", dailyStepsRange: "10,000 - 13,000", todaySteps: 10976),
    Celebrity(name: "Brie Larson", image: "Bri", dailyStepsRange: "9,000 - 12,000", todaySteps: 10324),
    Celebrity(name: "Keanu Reeves", image: "Kean", dailyStepsRange: "11,500 - 14,000", todaySteps: 12145),
    Celebrity(name: "Margot Robbie", image: "Marg", dailyStepsRange: "8,000 - 11,000", todaySteps: 9446)
]

