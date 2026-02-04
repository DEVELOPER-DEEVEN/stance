import SwiftUI

struct ReportsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Reports")
                SpotifyCard(title: "Export Hub", subtitle: "PDF & Share") {
                    Text("All generated reports appear here. Export, share, and archive.")
                        .font(.subheadline)
                        .foregroundColor(StanceTheme.textSecondary)
                }
                SpotifyCard(title: "Templates", subtitle: "Executive, Investor, Policy") {
                    Text("Coming soon: branded export packs and report formats.")
                        .font(.subheadline)
                        .foregroundColor(StanceTheme.textSecondary)
                }
            }
            .padding()
        }
        .background(StanceTheme.background)
        .navigationTitle("Reports")
    }
}
