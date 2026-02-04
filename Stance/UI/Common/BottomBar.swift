import SwiftUI

struct BottomBar: View {
    @Binding var selection: AppTab
    
    var body: some View {
        HStack(spacing: 18) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Button(action: { selection = tab }) {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.headline)
                        Text(tab.title)
                            .font(.caption2)
                    }
                    .foregroundColor(selection == tab ? StanceTheme.accent : StanceTheme.textSecondary)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(
            Capsule()
                .fill(StanceTheme.surfaceElevated)
                .overlay(Capsule().stroke(StanceTheme.surfaceHighlight, lineWidth: 1))
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 12)
    }
}

enum AppTab: CaseIterable {
    case home, insights, reports, settings
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .insights: return "Insights"
        case .reports: return "Reports"
        case .settings: return "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .insights: return "chart.line.uptrend.xyaxis"
        case .reports: return "doc.text.fill"
        case .settings: return "gearshape"
        }
    }
}
