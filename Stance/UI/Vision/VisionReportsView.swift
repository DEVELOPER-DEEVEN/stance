import SwiftUI

struct VisionReportsView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "1A1026"), Color(hex: "0F0A16")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Reports")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    VisionReportCard(title: "PDF Generated", subtitle: "Your analysis is ready.")
                    VisionReportCard(title: "Export Hub", subtitle: "Save, share, and archive your reports.")
                    VisionReportCard(title: "Templates", subtitle: "Executive • Investor • Policy")
                }
                .padding(24)
            }
        }
    }
}

struct VisionReportCard: View {
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
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
