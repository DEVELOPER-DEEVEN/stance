import SwiftUI

struct AppShelliOS: View {
    @State private var selection: AppTab = .home
    
    var body: some View {
        ZStack {
            StanceTheme.background.ignoresSafeArea()
            
            Group {
                switch selection {
                case .home:
                    DashboardView()
                case .insights:
                    InsightsView()
                case .reports:
                    ReportsView()
                case .settings:
                    SettingsView()
                }
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                DynamicIslandView(
                    title: "Stance",
                    subtitle: "Decision Advocacy",
                    actionTitle: "Settings",
                    action: { selection = .settings }
                )
                .padding(.top, 4)
                .padding(.horizontal, 14)
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                BottomBar(selection: $selection)
                    .padding(.bottom, 8)
            }
        }
    }
}
