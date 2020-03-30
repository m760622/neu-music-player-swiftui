//
//  ContentView.swift
//  Neu Music Player
//
//  Created by Wyatt Harrell on 3/30/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    BasicButton(imageName: "arrow.left")
                        //.padding(.leading, 40.0)
                    Spacer()
                    Text("PLAYING NOW")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.buttonColor)
                    Spacer()
                    BasicButton(imageName: "line.horizontal.3")
                        //.padding(.trailing, 40.0)
                }
                .padding(.trailing, 30.0)
                .padding(.leading, 30.0)

//                Circle()
//                    .frame(width: 300, height: 300)
//                    .padding(.top, 30)
//                    .padding(.bottom, 30)
//
//                Text("Low Life")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.buttonColor)
//                    .padding(.bottom, 8)
//                Text("Future ft. The Weekned")
//                    .font(.caption)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.buttonColor)

                Spacer()
                
                PlayPauseButton()
                    .frame(width: 75, height: 75)
            }
        }
        

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicButton: View {
    
    var imageName: String
    
    var body: some View {
        Button(action: {
            // TODO: - Add the back navigation later
        }) {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .frame(width: 50, height: 50)
                
                Image(systemName: imageName)
                    .resizable()
                    .font(Font.system(.headline).weight(.semibold))
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.buttonColor)
                    .frame(width: 20, height: 20)
                    .padding(12)
                    .background(LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
            }
        }
    }
}

struct PlayPauseButton: View {
    
    @State var isPlaying = true
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .topLeading, endPoint: .bottomTrailing))
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .padding(3)
                    
                Image(systemName: isPlaying ? "pause" : "play.fill")
                    .foregroundColor(.white)
                    .font(Font.system(.callout).weight(.black))
            }
        }
    }
    
    func colorsForIsPlaying() -> [Color] {
        if isPlaying {
            return [.pauseLightOrange, .pauseDarkOrange]
        } else {
            return [.pauseDarkOrange, .pauseLightOrange]
        }
    }
}
