//
//  calenderfixed.swift
//  GymSisApp
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI

struct calenderfixed: View {
    @State private var selectedDate = Date()
    @State private var navigateToDetail = false

    var body: some View {
        NavigationView {
            ZStack {
                // Dark green background
                Color(red: 0.094, green: 0.153, blue: 0.145)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Workout Calendar")
                        .padding(.bottom, 100)
                        .padding(.top,50)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 0.452, saturation: 0.068, brightness: 0.937))

                    // Cream background container for calendar
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 1.0, green: 0.98, blue: 0.94)) // Cream
                            .shadow(radius: 4)

                        DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            .tint(Color(red: 0.62, green: 0.88, blue: 0.80)) // Seafoam green
                    }
                    .padding(.horizontal)

                    NavigationLink(
                        destination: ExerciseDetailView(date: selectedDate),
                        isActive: $navigateToDetail
                    ) {
                        EmptyView()
                    }
                }
                .padding()
            }
            // Move onChange here so it always listens
            .onChange(of: selectedDate) { _ in
                navigateToDetail = true
            }
        }
    }
}

struct ExerciseDetailView: View {
    let date: Date
    @State private var selectedBodyPart = "arms"
    @State private var exercises = Array(repeating: "", count: 5)

    let bodyParts = ["arms", "legs", "abs", "chest", "back"]

    var body: some View {
        ZStack {
            Color(red: 0.094, green: 0.153, blue: 0.145) // Dark teal background
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Selected Date:")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top,20)

                    Text(dateFormatted)
                        .font(.title2)
                        .foregroundColor(.white)

                    Text("Choose Body Part:")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top,40)
                        .padding(.bottom,19)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(bodyParts, id: \.self) { part in
                                Text(part.capitalized)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(selectedBodyPart == part ? Color.teal : Color.gray.opacity(0.3))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        selectedBodyPart = part
                                    }
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(0..<exercises.count, id: \.self) { index in
                            TextField("Exercise \(index + 1)", text: $exercises[index])
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Workout for \(selectedBodyPart.capitalized)")
    }

    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

#Preview {
    calenderfixed()
}

