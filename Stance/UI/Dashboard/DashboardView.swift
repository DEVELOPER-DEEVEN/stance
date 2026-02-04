import SwiftUI

struct DashboardView: View {
    @Query(sort: \Claim.createdAt, order: .reverse) var claims: [Claim]
    @Environment(\.modelContext) var modelContext
    @State private var showNewAnalysis = false
    @State private var showSettings = false
    @State private var claimToDelete: Claim?
    @State private var showDeleteConfirm = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Text("Stance")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(StanceTheme.primaryGradient)
                    Spacer()
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(StanceTheme.textSecondary)
                    }
                }
                .padding()
                
                if claims.isEmpty {
                    Spacer()
                    ContentUnavailableView(
                        "No Stances Active",
                        systemImage: "scale.3d",
                        description: Text("Start a new analysis to advocate for your position.")
                    )
                    Spacer()
                } else {
                    List {
                        ForEach(claims) { claim in
                            NavigationLink(destination: AnalysisDetailView(claim: claim)) {
                                VStack(alignment: .leading) {
                                    Text(claim.originalText)
                                        .font(.headline)
                                        .foregroundColor(StanceTheme.textPrimary)
                                    Text(claim.status.rawValue.capitalized)
                                        .font(.caption)
                                        .foregroundColor(StanceTheme.textSecondary)
                                }
                                .padding(.vertical, 8)
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
                    .scrollContentBackground(.hidden)
                }
                
                Button(action: { showNewAnalysis = true }) {
                    Text("New Analysis")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(StanceTheme.primaryGradient)
                        .cornerRadius(12)
                }
                .padding()
            }
            .background(StanceTheme.background.edgesIgnoringSafeArea(.all))
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
}

#Preview {
    DashboardView()
}
