import SwiftUI

struct SplitLayoutView: View {
    @Query(sort: \Claim.createdAt, order: .reverse) var claims: [Claim]
    @State private var selectedClaim: Claim?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var showNewAnalysis = false

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // Sidebar
            List(selection: $selectedClaim) {
                Section(header: Text("Active Analyses")) {
                    ForEach(claims) { claim in
                        NavigationLink(value: claim) {
                            VStack(alignment: .leading) {
                                Text(claim.originalText)
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(claim.status.rawValue.capitalized)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Stance")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { showNewAnalysis = true }) {
                        Label("New Analysis", systemImage: "plus")
                    }
                }
            }
        } detail: {
            // Detail Area
            if let claim = selectedClaim {
                AnalysisDetailView(claim: claim)
            } else {
                ContentUnavailableView(
                    "Select an Analysis",
                    systemImage: "doc.text.magnifyingglass",
                    description: Text("Choose a stance from the sidebar or create a new one.")
                )
            }
        }
        .sheet(isPresented: $showNewAnalysis) {
            NewAnalysisView()
        }
    }
}
