//
//  ContentView.swift
//  GymSisApp
//
//  Created by Scholar on 7/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.094, green: 0.153, blue: 0.145) // Custom RGB color
                .ignoresSafeArea()
            VStack {
                Image("gymsis")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .foregroundColor(Color(hue: 0.451, saturation: 0.047, brightness: 0.963))
                Button(action:{}){
                    Text("Set Goals")
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.492, saturation: 0.877, brightness: 0.155))
                        .padding(13)
                        .frame(width: 250)
                        .background(Color(red: 159/255, green: 221/255, blue: 191/255))
                        .cornerRadius(15)
                    Text("Testing")
                    
                }
                .padding(.bottom,13)
                Button(action:{}){
                    Text("Log Progress")
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.492, saturation: 0.877, brightness: 0.155))
                        .padding(13)
                        .frame(width: 250)
                        .background(Color(red: 159/255, green: 221/255, blue: 191/255))
                        .cornerRadius(15)
                    
                }
                .padding(.bottom,13)
                Button(action:{}){
                    Text("Reflect")
                        .font(.headline)
                        .foregroundColor(Color(hue: 0.492, saturation: 0.877, brightness: 0.155))
                        .padding(13.0)
                        .frame(width: 250)
                        .background(Color(red: 159/255, green: 221/255, blue: 191/255))
                        .cornerRadius(15)
                    
                }
                
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
