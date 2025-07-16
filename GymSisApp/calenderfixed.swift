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
            VStack(spacing: 20) {
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .onChange(of: selectedDate) { _ in
                        navigateToDetail = true
                    }

                NavigationLink(
                    destination: ExerciseDetailView(date: selectedDate),
                    isActive: $navigateToDetail
                ) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Workout Calendar")
        }
    }
}

struct ExerciseDetailView: View {
    let date: Date
    @State private var selectedBodyPart = "arms"
    @State private var exercises = Array(repeating: "", count: 5)

    let bodyParts = ["arms", "legs", "abs", "chest", "back"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Selected Date:")
                    .font(.headline)

                Text(dateFormatted)
                    .font(.title2)

                Text("Choose Body Part:")
                    .font(.headline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(bodyParts, id: \.self) { part in
                            Text(part.capitalized)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(selectedBodyPart == part ? Color.blue : Color.gray.opacity(0.3))
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
