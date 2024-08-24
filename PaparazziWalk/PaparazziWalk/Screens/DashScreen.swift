//
//  DashScreen.swift
//  PaparazziWalk
//
//  Created by Shiro NoKage on 2024/08/10.
//

import SwiftUI

struct DashScreen: View {
    
    @State var progressValue: Float = 0.0
    
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
                            .font(.system(size: 9))
                            .foregroundStyle(Color("Primary"))
                            .padding(5)
                        Spacer()
                    }
                    
//                    ProgressBarCircle(progress: self.$progressValue)
//                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
//                        .onAppear(){
//                            self.progressValue = 0.50
//                        }
                    ProgressBar(width: 300, height: 20, percent: 20)
                        .animation(.easeInOut(duration: 2.0))
                    
                    Text("2,839")
                        .font(.system(size: 20))
                        .foregroundStyle(Color("Primary"))
                    Text("Steps")
                        .font(.system(size: 9))
                        .foregroundStyle(Color("Primary"))
                    VStack{
                        HStack{
                            Text("34% of your target")
                            Spacer()
                                .frame(width: 175)
                            
                        }
                        Text("Brad Pitt ").font(.custom("Outfit-Bold", size: 12)) +
                        Text("walked ") +
                        Text("4,245 ").font(.custom("Outfit-Bold", size: 12)) +
                        Text("more steps than you today")
                    }
                    .font(.system(size: 12))
                    .padding(5)
                    
                    Button(action: {}, label: {
                        Text("Change Target")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding( .vertical, 10)
                            .background(Color("Primary"))
                            .cornerRadius(50)
                    })
                }
                .frame(width: 392, height: 230)
                
                .background(Color(.white))
                .cornerRadius(8)
                Spacer()
                    .frame(height:10)
                VStack{
                    VStack{
                        HStack{
                            Text("Steps this week:")
                                .font(.custom("Outfit-Thin", size: 18))
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                    
                }
                .frame(width: 392, height: 200)
                
                .background(Color(.white))
                .cornerRadius(8)
                Spacer()
                    .frame(height:10)
                HStack{
                    NavigationLink(destination: ProfileScreen()) {
                        VStack{
                            Text("Profile and Stats")
                                .font(.custom("Outfit-Thin", size: 18))
                                .foregroundStyle(Color(.black))
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color("Primary"))
                            Text("See your stats and progress")
                                .font(.custom("Outfit-Thin", size: 12))
                                .foregroundStyle(Color(.black))
                            }
                            .frame(width: 200, height: 200)
                            .background(Color(.white))
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: CelebScreen()) {
                        VStack{
                            Text("Celebrities")
                                .font(.custom("Outfit-Thin", size: 18))
                                .foregroundStyle(Color(.black))
                            Image(systemName: "person.2.crop.square.stack")
                                .resizable()
                                .frame(width: 80, height: 90)
                                .foregroundColor(Color("Primary"))
                            Text("Browse other celebrities and their walking habits")
                                .font(.custom("Outfit-Thin", size: 12))
                                .foregroundStyle(Color(.black))
                            }
                            .frame(width: 200, height: 200)
                            .background(Color(.white))
                            .cornerRadius(8)
                    }
                    
                    
                }
                Spacer()
                
            }
            .font(.custom("Outfit-Regular", size:20))
            
        }
        .frame(width: 450, height: 700)
        .background(Color("Body"))
        Spacer()
        
    }
}


///Code from a video guide: https://youtube.com/watch?v=ikoS43QtLYE
struct ProgressBarCircle: View {
    @Binding var progress: Float
    var color: Color = Color("Primary")
    
    var body: some View{
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0))
        }
    }
}


///Code from a video guide: https://youtube.com/watch?v=jyOnBUxglcA
struct ProgressBar: View {
    
    var width: CGFloat = 300
    var height: CGFloat = 20
    var percent: CGFloat = 70
    
    var color: Color = Color("Primary")
    
    var body: some View{
        
        let multiplier = width / 100
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.pink, Color("Primary")]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
                .animation(.easeInOut(duration: 2.0))
            
        }
    }
}



#Preview {
    DashScreen()
}
