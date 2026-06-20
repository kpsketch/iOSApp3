import SwiftUI

struct ContentView: View {

    let goal = 8

    @State private var glasses = 0
    @State private var showGoalAlert = false

    var progressColor: Color {
        if glasses >= goal {
            return .green
        } else if glasses >= 5 {
            return .orange
        } else {
            return .blue
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {

                Text(Date(), style: .time)
                    .font(.caption2)
                    .foregroundStyle(.gray)

                Image(systemName: "drop.fill")
                    .font(.system(size: 28))
                    .foregroundStyle(progressColor)

                Text("Water Tracker")
                    .font(.headline)

                ProgressView(value: Double(glasses), total: Double(goal))
                    .tint(progressColor)

                Text("\(glasses) / \(goal) Glasses")
                    .font(.caption)
                
                if glasses == goal {
                    Text("🎉 Daily Goal Complete!")
                        .font(.caption2)
                        .foregroundStyle(.green)
                } else {
                    Text("Stay hydrated!")
                        .font(.caption2)
                        .foregroundStyle(.blue)
                }

                Button {
                    if glasses < goal {
                        glasses += 1
                    }

                    if glasses == goal {
                        showGoalAlert = true
                    }
                } label: {
                    Label("Drink Water", systemImage: "plus.circle.fill")
                }

                NavigationLink {
                    AchievementView(glasses: glasses, goal: goal)
                } label: {
                    Label("Achievement", systemImage: "trophy.fill")
                }

                Button {
                    glasses = 0
                } label: {
                    Label("Reset", systemImage: "arrow.counterclockwise")
                }
            }
            .padding()
            .alert("Goal Reached!", isPresented: $showGoalAlert) {
                Button("Great!") { }
            } message: {
                Text("You reached your daily water goal.")
            }
        }
    }
}

#Preview {
    ContentView()
}
