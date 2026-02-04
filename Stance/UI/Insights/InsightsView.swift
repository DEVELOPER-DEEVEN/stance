import SwiftUI

struct InsightsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Insights")
                SpotifyCard(title: "Advocacy Momentum", subtitle: "Last 30 days") {
                    Text("Track how strongly your positions are trending over time.")
                        .font(.subheadline)
                        .foregroundColor(StanceTheme.textSecondary)
                }
                SpotifyCard(title: "Top Drivers", subtitle: "Most common supportive dimensions") {
                    Text("Economic impact, market growth, operational efficiency.")
                        .font(.subheadline)
                        .foregroundColor(StanceTheme.textSecondary)
                }
                SpotifyCard(title: "Confidence Trend", subtitle: "Average advocacy strength") {
                    ConfidenceMeter(confidence: 0.82, label: "Current")
                }
            }
            .padding()
        }
        .background(StanceTheme.background)
        .navigationTitle("Insights")
    }
}
