import SwiftUI

struct AppShelliOS: View {
    @State private var selection: AppTab = .home
    
    var body: some View {
        ZStack {
            StanceTheme.background.ignoresSafeArea()
            
            Group {
                switch selection {
                case .home:
                    VisionHomeView()
                case .insights:
                    VisionInsightsView()
                case .reports:
                    VisionReportsView()
                case .settings:
                    VisionSettingsView()
                }
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                BottomBar(selection: $selection)
                    .padding(.bottom, 8)
            }
        }
    }
}
