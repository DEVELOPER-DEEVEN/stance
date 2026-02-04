import SwiftUI

struct AppShelliOS: View {
    @State private var selection: AppTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
            .safeAreaInset(edge: .top) {
                DynamicIslandView(
                    title: "Stance",
                    subtitle: "Decision Advocacy",
                    actionTitle: "Settings",
                    action: { selection = .settings }
                )
                .padding(.top, 6)
            }
            
            BottomBar(selection: $selection)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
