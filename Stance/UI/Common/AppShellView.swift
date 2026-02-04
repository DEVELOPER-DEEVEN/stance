import SwiftUI

struct AppShellView: View {
    var body: some View {
#if os(iOS)
        TabView {
            DashboardView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            InsightsView()
                .tabItem { Label("Insights", systemImage: "chart.line.uptrend.xyaxis") }
            ReportsView()
                .tabItem { Label("Reports", systemImage: "doc.text.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
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
