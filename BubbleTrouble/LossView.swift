//
//  LossView.swift
//  BubbleTrouble
//
//  Created by Partho Das on 3/26/25.
//

import SwiftUI

struct LossView: View {
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("YOU LOST!")
                    .font(.custom("Rounded MT Bold", size: 90))
                    .foregroundColor(.blue)
                    .bold()
                
                Text("HIGH SCORE: 521")
                    .font(.custom("Lobster", size: 50))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    Button {
                       
                    } label: {
                        Text("PLAY AGAIN")
                            .font(.custom("Lobster", size: 40))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button {
                    } label: {
                        Text("Main Menu")
                            .font(.custom("Lobster", size: 40))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .padding()
            .frame(width: 800)
            .background(Color.white.opacity(0.2))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    LossView()
}
