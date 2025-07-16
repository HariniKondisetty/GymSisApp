
import SwiftUI

struct Instructions: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 24) {
                    Text("Instructions")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 0.466, saturation: 0.062, brightness: 0.983))
                        .multilineTextAlignment(.center)
                        .padding()

                    // Title
                    Text("Set Your Daily Health Goals")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 0.427, saturation: 0.217, brightness: 0.908))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 4)

                    Text("Take a look at the tips below to customize your daily intake for water, protein, and fiber based on your body and lifestyle to help your progress.")
                        .font(.subheadline)
                        .foregroundColor(Color(hue: 0.447, saturation: 0.069, brightness: 0.954))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 23)

                    // Sections
                    sectionView(
                        title: "  Water 💦",
                        content: """
                        • Drink half your body weight in ounces.
                        • 140 lbs → 70 oz of water/day.
                        • Add more if you're active or sweat often.
                        """
                    )

                    sectionView(
                        title: "  Protein 🍗",
                        content: """
                        • Aim for 0.36g per pound of body weight.
                        • For fitness: 0.6–1g per pound.
                        • 150 lbs × 0.8 = ~120g/day.
                        """
                    )

                    sectionView(
                        title: "  Fiber 🍎",
                        content: """
                        • 25g/day for women, 38g/day for men.
                        • Increase slowly to avoid discomfort.
                        • Found in fruits, veggies, grains, legumes.
                        """
                    )

                    // 🚀 NavigationLink to Tracker
                    NavigationLink(destination: Tracker()) {
                        Text("Go to Tracker")
                            .font(.headline)
                            .foregroundColor(Color(hue: 0.479, saturation: 0.9, brightness: 0.166))
                            .frame(width: 250, height:40)
                            .background(Color(red: 0.6, green: 0.8, blue: 0.7))
                            .cornerRadius(12)
                            .padding(.bottom,40)
                        
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
            .background(Color(red: 0.094, green: 0.153, blue: 0.145))
        }
    }

    // MARK: - Section View
    @ViewBuilder
    func sectionView(title: String, content: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundColor(Color(hue: 0.461, saturation: 0.8, brightness: 0.179))
            Text(content)
                .font(.subheadline)
                .foregroundColor(Color(hue: 0.474, saturation: 0.918, brightness: 0.21))
                .lineSpacing(4)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(14)
    }
}

// Dummy TrackerView for preview/testing


#Preview {
    Instructions()
}

