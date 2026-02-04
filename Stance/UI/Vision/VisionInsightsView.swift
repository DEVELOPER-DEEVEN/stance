import SwiftUI

struct VisionInsightsView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "1A1026"), Color(hex: "0F0A16")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.white.opacity(0.08))
                            .clipShape(Circle())
                        Spacer()
                        Text("Key Insights")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    HStack(spacing: 12) {
                        VisionStatCard(title: "Confidence", value: "85%", delta: "+2.4%")
                        VisionStatCard(title: "Signals", value: "12", delta: "3 New")
                    }
                    
                    Text("Executive Summary")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    VisionInsightCard(tag: "CRITICAL", title: "Market Volatility Spike", subtitle: "Detected unusual trading volume in Asian markets…")
                    VisionInsightCard(tag: "OPPORTUNITY", title: "Supply Chain Resilience", subtitle: "Logistics buffers increased by 15% in Q3…")
                    VisionInsightCard(tag: "WATCHLIST", title: "Regional Policy Shift", subtitle: "EU regulatory vote may impact…")
                    VisionInsightCard(tag: "INFO", title: "Oil Price Stabilization", subtitle: "Brent crude stabilizing around $82/barrel…")
                    
                    Button(action: {}) {
                        Text("View Full Analysis →")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [Color(hex: "8B5CF6"), Color(hex: "A855F7")], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(22)
                    }
                    .padding(.top, 6)
                }
                .padding(24)
                .padding(.bottom, 180)
            }
        }
    }
}

struct VisionStatCard: View {
    let title: String
    let value: String
    let delta: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title.uppercased())
                .font(.caption2)
                .foregroundColor(.white.opacity(0.6))
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(delta)
                .font(.caption)
                .foregroundColor(Color(hex: "57E389"))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.06))
        .cornerRadius(16)
    }
}

struct VisionInsightCard: View {
    let tag: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(hex: "7C3AED"))
                .frame(width: 4)
            VStack(alignment: .leading, spacing: 6) {
                Text(tag)
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.5))
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(subtitle)
                    .foregroundColor(.white.opacity(0.6))
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
