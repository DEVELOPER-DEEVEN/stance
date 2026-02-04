import SwiftUI

struct VisionMethodologyView: View {
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
                        Text("Methodology")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                    }
                    
                    Text("How Stance works")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Our engine processes millions of data points to deliver actionable intelligence through a three‑step analytical framework.")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.subheadline)
                    
                    VisionMethodologyStep(title: "Pattern Discovery", subtitle: "Identifying recurring signals within unstructured datasets using vector mapping.")
                    VisionMethodologyStep(title: "Trend Analysis", subtitle: "Forecasting directionality and velocity of emerging market movements.")
                    VisionMethodologyStep(title: "Correlation Framing", subtitle: "Establishing causality between events to reduce noise.")
                    
                    Text("Engine Precision")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    HStack(spacing: 12) {
                        VisionBadge(title: "Verified", subtitle: "100% audited sources")
                        VisionBadge(title: "Real‑time", subtitle: "Sub‑second latency")
                    }
                    
                    Button(action: {}) {
                        Text("Continue")
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

struct VisionMethodologyStep: View {
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

struct VisionBadge: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            Text(subtitle)
                .foregroundColor(.white.opacity(0.6))
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.06))
        .cornerRadius(16)
    }
}
