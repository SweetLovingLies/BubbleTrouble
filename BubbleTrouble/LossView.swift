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
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Image("RoundedRectangle")

            VStack(spacing: 20) {
                Image("YouLost")
                    .font(.custom("Rounded MT Bold", size: 90))
                    .bold()

                Text("HIGH SCORE: 521")
                    .font(.custom("Lobster", size: 50))
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    Button {

                    } label: {
                        Image("PlayAgain")
                            .font(.custom("Lobster", size: 40))
                            .padding()
                            .cornerRadius(10)
                        
                    }
                    .buttonStyle(.plain)

                    Button {
                    } label: {
                        Image("MainMenu")
                            .font(.custom("Lobster", size: 40))
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)

                }
                .padding()
            }
            
        }
    }
}

#Preview {
    LossView()
}
