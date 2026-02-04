import SwiftUI
import SwiftData

struct SplitLayoutView: View {
    @Query(sort: \Claim.createdAt, order: .reverse) var claims: [Claim]
    @Environment(\.modelContext) var modelContext
    @State private var selectedClaim: Claim?
    @State private var searchText = ""
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var showNewAnalysis = false
    @State private var showSettings = false
    @State private var claimToDelete: Claim?
    @State private var showDeleteConfirm = false

    var filteredClaims: [Claim] {
        if searchText.isEmpty {
            return claims
        } else {
            return claims.filter { $0.originalText.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // Sidebar
            List(selection: $selectedClaim) {
                if filteredClaims.isEmpty {
                    EmptyStateView(
                        icon: "magnifyingglass",
                        title: "No Results",
                        message: "Try a different search or create a new analysis.",
                        action: { showNewAnalysis = true },
                        actionLabel: "New Analysis"
                    )
                    .listRowBackground(StanceTheme.background)
                } else {
                    Section(header: Text("Active Analyses")) {
                        ForEach(filteredClaims) { claim in
                            NavigationLink(value: claim) {
                                AnalysisRowView(claim: claim)
                            }
                            .listRowBackground(StanceTheme.surface)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    claimToDelete = claim
                                    showDeleteConfirm = true
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Stance")
            .searchable(text: $searchText, placement: .sidebar, prompt: "Search Analyses")
            .scrollContentBackground(.hidden)
            .background(StanceTheme.background)
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape")
                    }
                }
#endif
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
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .alert("Delete Analysis?", isPresented: $showDeleteConfirm) {
            Button("Cancel", role: .cancel) { claimToDelete = nil }
            Button("Delete", role: .destructive) {
                if let claim = claimToDelete {
                    modelContext.delete(claim)
                    claimToDelete = nil
                }
            }
        } message: {
            Text("This action cannot be undone.")
        }
    }
}
