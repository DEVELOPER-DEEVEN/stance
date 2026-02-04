import SwiftUI
import SwiftData

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
                    EmptyStateView(
                        icon: "scale.3d",
                        title: "No Stances Active",
                        message: "Start a new analysis to advocate for your position.",
                        action: { showNewAnalysis = true },
                        actionLabel: "New Analysis"
                    )
                    Spacer()
                } else {
                    List {
                        ForEach(claims) { claim in
                            NavigationLink(destination: AnalysisDetailView(claim: claim)) {
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
                    .scrollContentBackground(.hidden)
                }
                
                if !claims.isEmpty {
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
            }
            .background(StanceTheme.background.edgesIgnoringSafeArea(.all))
#if os(iOS)
            .fullScreenCover(isPresented: $showNewAnalysis) {
                NewAnalysisView()
            }
#else
            .sheet(isPresented: $showNewAnalysis) {
                NewAnalysisView()
            }
#endif
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
