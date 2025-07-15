//
//  ReflectView.swift
//  GymSisApp
//
//  Created by Scholar on 7/15/25.
//

import SwiftUI

struct ReflectView: View {
    @State private var generatedText: String = ""
    @State private var userResponse : String = ""
    var body: some View {
        ZStack{
            Color(red:0.094, green:0.153, blue: 0.145)
                .ignoresSafeArea()
            VStack{
                Text("Daily Reflection")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.458, saturation: 0.12, brightness: 0.84))
                    .padding(.top,50)

                Text(generatedText)
                    .font(.title2)
                    .foregroundColor(Color(red:159/255,green:221/255,blue:191/255))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top,55)
                Text("Type Reflection Here ")
                    .font(.headline)
                    .foregroundColor(Color(hue: 0.447, saturation: 0.163, brightness: 0.775))
                    .padding(.top,50)
                    .padding(.bottom,20)
                TextEditor(text: $userResponse)
                    .frame(height: 260)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                Spacer()
                
            }
            .padding()
        }
        .onAppear {
            generateNewText()
        }
        }
    
    
    func generateNewText() {
        let texts = ["When did you feel most at peace today?", "What thoughts have been on your mind throughout today?", "What are three things you are grateful for today?", "What makes you feel proud of who you are?", "What are you looking forward to this week?"]
        generatedText = texts.randomElement() ?? "No text generated"
        userResponse = ""
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
    ReflectView()
}
