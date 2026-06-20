import SwiftUI

struct AchievementView: View {

    let glasses: Int
    let goal: Int

    var body: some View {
        VStack(spacing: 12) {

            if glasses >= goal {
                Image(systemName: "trophy.fill")
                    .font(.system(size: 35))
                    .foregroundStyle(.yellow)

                Text("Goal Reached!")
                    .font(.headline)

                Text("Excellent work today.")
                    .font(.caption)
                    .multilineTextAlignment(.center)

            } else {
                Image(systemName: "figure.walk")
                    .font(.system(size: 35))
                    .foregroundStyle(.green)

                Text("Keep Going!")
                    .font(.headline)

                Text("You drank \(glasses) of \(goal) glasses.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }

            ProgressView(value: Double(glasses), total: Double(goal))
                .tint(glasses >= goal ? .green : .blue)
        }
        .padding()
    }
}

#Preview {
    AchievementView(glasses: 5, goal: 8)
}
