import SwiftUI

struct VisionDecisionSummaryView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "1A1026"), Color(hex: "0F0A16")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Decision Summary")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                    }
                    
                    Text("Recommendation: Proceed with Strategic Expansion")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Based on predictive modeling, expansion into APAC yields the highest long‑term ROI potential compared to domestic consolidation.")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.subheadline)
                    
                    VisionChartCard(title: "Projected Growth", value: "92%", delta: "+15% vs Baseline")
                    
                    Text("Best‑case Scenarios")
                        .foregroundColor(.white)
                        .font(.headline)
                    VisionScenarioRow(title: "Market Dominance", subtitle: "Capture 40% market share within 18 months.")
                    VisionScenarioRow(title: "Revenue Multiplier", subtitle: "Potential to 3x revenue streams via localized partnerships.")
                    
                    Text("Trade‑offs & Risks")
                        .foregroundColor(.white)
                        .font(.headline)
                    VisionScenarioRow(title: "Regulatory Overhead", subtitle: "Initial setup requires significant legal compliance resources.")
                    VisionScenarioRow(title: "Time to Value", subtitle: "Breakeven projected at 14 months.")
                    
                    Button(action: {}) {
                        Text("Generate PDF Report")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [Color(hex: "8B5CF6"), Color(hex: "A855F7")], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(22)
                    }
                }
                .padding(24)
            }
            .visionBottomInset(140)
        }
    }
}

struct VisionChartCard: View {
    let title: String
    let value: String
    let delta: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.caption2)
                .foregroundColor(.white.opacity(0.6))
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(delta)
                .font(.caption)
                .foregroundColor(Color(hex: "57E389"))
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.08))
                .frame(height: 120)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(18)
    }
}

struct VisionScenarioRow: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle().fill(Color(hex: "8B5CF6")).frame(width: 10, height: 10)
                .padding(.top, 6)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(subtitle)
                    .foregroundColor(.white.opacity(0.6))
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
