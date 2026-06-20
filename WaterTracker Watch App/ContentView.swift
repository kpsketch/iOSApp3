import SwiftUI

struct ContentView: View {

    // Daily water goal
    let goal = 8

    // Tracks how many glasses user drank
    @State private var glasses = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                Image(systemName: "drop.fill")
                    .font(.system(size: 35))
                    .foregroundStyle(.blue)

                Text("Water Tracker")
                    .font(.headline)

                ProgressView(value: Double(glasses), total: Double(goal))

                Text("\(glasses) / \(goal) Glasses")
                    .font(.caption)

                Button {
                    if glasses < goal {
                        glasses += 1
                    }
                } label: {
                    Label("Drink Water", systemImage: "plus.circle.fill")
                }

                Button {
                    glasses = 0
                } label: {
                    Label("Reset", systemImage: "arrow.counterclockwise")
                }

                NavigationLink {
                    AchievementView(glasses: glasses, goal: goal)
                } label: {
                    Text("Achievement")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
