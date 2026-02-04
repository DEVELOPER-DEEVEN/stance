import SwiftUI

struct AppShellView: View {
    var body: some View {
#if os(iOS)
        AppShelliOS()
#else
        NavigationSplitView {
            List {
                NavigationLink(destination: DashboardView()) { Label("Home", systemImage: "house.fill") }
                NavigationLink(destination: InsightsView()) { Label("Insights", systemImage: "chart.line.uptrend.xyaxis") }
                NavigationLink(destination: ReportsView()) { Label("Reports", systemImage: "doc.text.fill") }
                NavigationLink(destination: SettingsView()) { Label("Settings", systemImage: "gearshape") }
            }
            .listStyle(.sidebar)
            .navigationTitle("Stance")
        } detail: {
            DashboardView()
        }
#endif
    }
}
