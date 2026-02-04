import SwiftUI

struct VisionOnboardingView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "2B0A4A"), Color(hex: "120814")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Text("Skip")
                        .font(.subheadline)
                        .foregroundColor(StanceTheme.textSecondary)
                }
                
                Text("Master Your Decisions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Professional intelligence for the modern strategist.")
                    .foregroundColor(StanceTheme.textSecondary)
                
                Spacer()
                
                VStack(spacing: 14) {
                    VisionFeatureRow(icon: "flag.fill", title: "Define a Stance", subtitle: "Clearly articulate your hypothesis or strategic position to begin.")
                    VisionFeatureRow(icon: "chart.bar.xaxis", title: "Analyze Data", subtitle: "Leverage AI to process evidence, metrics, and trends.")
                    VisionFeatureRow(icon: "sparkles", title: "Generate Insight", subtitle: "Receive actionable intelligence ready for immediate execution.")
                }
                
                Spacer()
                
                Button(action: {}) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(StanceTheme.primaryGradient)
                        .cornerRadius(18)
                }
            }
            .padding(24)
        }
    }
}

struct VisionFeatureRow: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .frame(width: 44, height: 44)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(subtitle)
                    .foregroundColor(StanceTheme.textSecondary)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
