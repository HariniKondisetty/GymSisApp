//
//  calender.swift
//  GymSisApp
//
//  Created by Scholar on 7/15/25.
//

        import SwiftUI

        struct calender: View {
            @State private var selectedDate = Date()
            @State private var shouldNavigate = false

            var body: some View {
                NavigationView {
                    VStack {
                        DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .onChange(of: selectedDate) { newDate in
                                shouldNavigate = true
                            }

                        NavigationLink(
                            destination: DateDetailView(date: selectedDate),
                            isActive: $shouldNavigate
                        ) {
                            EmptyView()
                        }
                    }
                    .navigationTitle("Pick a Date")
                }
            }
        }

        struct DateDetailView: View {
            var date: Date

            var body: some View {
                VStack {
                    Text("Selected Date:")
                        .font(.headline)
                    Text(date, style: .date)
                        .font(.largeTitle)
                }
                .padding()
                .navigationTitle("Date Detail")
            }
        }

    


#Preview {
    calender()
}
