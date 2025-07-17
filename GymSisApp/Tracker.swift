//
//  Tracker.swift
//  GymSisApp
//
//  Created by Scholar on 7/16/25.
//

import SwiftUI
struct Tracker: View {
  @State private var waterDrank: Int = 0
  @State private var proteinEaten: Int = 0
  @State private var fiberEaten: Int = 0
  let waterGoal: Int = 80
  let proteinGoal: Int = 200
  let fiberGoal: Int = 50
  var waterProgress: Double {
    min(Double(waterDrank) / Double(waterGoal), 1.0)
  }
  var proteinProgress: Double {
    min(Double(proteinEaten) / Double(proteinGoal), 1.0)
  }
  var fiberProgress: Double {
    min(Double(fiberEaten) / Double(fiberGoal), 1.0)
  }
  var body: some View {
    ScrollView {
      ZStack {
        Color(red:0.094, green:0.153, blue:0.145)
          .ignoresSafeArea()
        VStack(spacing: 40) {
          Text("Health Tracker")
            .foregroundColor(Color(hue: 0.446, saturation: 0.107, brightness: 0.944))
            .font(.title)
            .fontWeight(.bold)
          // Water
          nutrientSection(
            title: "Water Intake 💦",
            current: $waterDrank,
            goal: waterGoal,
            color: Color(hue: 0.573, saturation: 0.355, brightness: 1.0),
            unit: "oz",
            progress: waterProgress,
            step: 8
          )
          // Protein
          nutrientSection(
            title: "Protein Intake 🍗",
            current: $proteinEaten,
            goal: proteinGoal,
            color: .orange,
            unit: "g",
            progress: proteinProgress,
            step: 5
          )
          // Fiber
          nutrientSection(
            title: "Fiber Intake 🍎",
            current: $fiberEaten,
            goal: fiberGoal,
            color: .red,
            unit: "g",
            progress: fiberProgress,
            step: 5
          )
          Spacer()
        }
        .padding()
        .foregroundColor(Color(hue: 0.446, saturation: 0.107, brightness: 0.944))
      }
    }
  }
  // MARK: - Nutrient Section with + / - buttons
  func nutrientSection(title: String, current: Binding<Int>, goal: Int, color: Color, unit: String, progress: Double, step: Int) -> some View {
    VStack(spacing: 20) {
      Text(title)
        .font(.headline)
      progressCircle(progress: progress, color: color)
      Text("\(current.wrappedValue) / \(goal) \(unit)")
      HStack(spacing: 20) {
        Button(action: {
          if current.wrappedValue >= step {
            current.wrappedValue -= step
          }
        }) {
          Text("−")
            .font(.title)
            .frame(width: 44, height: 44)
            .background(Color.gray.opacity(0.2))
            .clipShape(Circle())
        }
        Button(action: {
          current.wrappedValue += step
        }) {
          Text("+")
            .font(.title)
            .frame(width: 44, height: 44)
            .background(color)
            .foregroundColor(.white)
            .clipShape(Circle())
        }
      }
    }
  }
  // MARK: - Circular Progress View
  func progressCircle(progress: Double, color: Color) -> some View {
    ZStack {
      Circle()
        .strokeBorder(color.opacity(0.2), lineWidth: 4)
        .background(Circle().fill(color.opacity(0.1)))
        .frame(width: 120, height: 120)
      GeometryReader { geo in
        let height = geo.size.height
        VStack {
          Spacer()
          Rectangle()
            .fill(color)
            .frame(height: CGFloat(progress) * height)
        }
        .mask(Circle())
      }
      .frame(width: 120, height: 120)
    }
  }
}
#Preview {
  Tracker()
}





















