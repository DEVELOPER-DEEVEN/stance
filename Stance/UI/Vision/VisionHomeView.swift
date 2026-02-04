import SwiftUI
import SwiftData

struct VisionHomeView: View {
    @Query(sort: \Claim.createdAt, order: .reverse) var claims: [Claim]
    @State private var showNewAnalysis = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "2B0A4A"), Color(hex: "120814")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("STANCE")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                        .tracking(4)
                    
                    Text("Master Your Decisions")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Professional intelligence for the modern strategist.")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.subheadline)
                        .padding(.bottom, 8)
                    
                    VisionPrimaryCard(title: "Define a Stance", subtitle: "Start a new analysis", icon: "flag.fill") {
                        showNewAnalysis = true
                    }
                    VisionPrimaryCard(title: "Analyze Data", subtitle: "AI‑assisted evidence & trends", icon: "chart.bar.xaxis") {}
                    VisionPrimaryCard(title: "Generate Insight", subtitle: "Consulting‑grade output", icon: "sparkles") {}
                    
                    if !claims.isEmpty {
                        Text("Recent Analyses")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        ForEach(claims.prefix(3)) { claim in
                            VisionListRow(title: claim.originalText, subtitle: claim.status.rawValue.capitalized)
                        }
                    }
                }
                .padding(24)
                .padding(.bottom, 100)
            }
        }
#if os(iOS)
        .fullScreenCover(isPresented: $showNewAnalysis) {
            VisionInputView()
        }
#endif
    }
}

struct VisionPrimaryCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
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
                        .foregroundColor(.white.opacity(0.7))
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
            .background(Color.white.opacity(0.06))
            .cornerRadius(18)
        }
        .buttonStyle(.plain)
    }
}

struct VisionListRow: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.subheadline)
                Text(subtitle)
                    .foregroundColor(.white.opacity(0.6))
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.4))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
