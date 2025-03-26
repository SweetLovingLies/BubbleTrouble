//
//  MainMenu.swift
//  BubbleTrouble
//
//  Created by Shakira Al-Jahmee on 3/24/25.
//

import SwiftUI
//
struct MainMenu: View {
    @State private var highScore: Int = 0

    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 5) {
                        Image("HighScore")
                        
                        Text("\(highScore)") //display score
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
                    .padding(.top, -450)
                }
            }

            Image("Plate")
            Image("Bubbles")
                .padding(.top, 850)
            Image("Title")
                .padding(.top, -400)
            
            Button(action: {
                // action
            }) {
                Image("PlayButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 700, height: 1000)
            }
            .buttonStyle(.plain)
            
            Button(action: {
                // action
            }) {
                Image("HowToPlayButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 700, height: 1000)
            }
            .buttonStyle(.plain)
            .padding(.top, 300)
            
            HStack {
                Button(action: {
                    // action
                }) {
                    Image("UnmuteButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .buttonStyle(.plain)
                .padding(.top, 300)
                Button(action: {
                    // action
                }) {
                    Image("MuteButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .buttonStyle(.plain)
                .padding(.top, 300)
            }
            .padding(.top, 400)
            
        }
    }
}

#Preview {
    MainMenu()
}
