//
//  ControlsView.swift
//  Bubble Trouble
//
//  Created by Jerret Johnson on 3/24/25.
//
import SwiftUI

struct ControlsView: View {
    var body: some View {
        
       
            
        ZStack {
            
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image("Controls")
                .padding(.top,-500)
            }
        
        HStack(spacing: -50) {
                
                
                Image("Controller")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 700, height:700)
                
                    .padding(50)
                
                Image("Controller2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800, height:800)
                            }
            .padding(-800)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
