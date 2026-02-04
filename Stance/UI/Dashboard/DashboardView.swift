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
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Hero Card
                    SpotifyCard(title: "Decision Advocacy", subtitle: "Premium Intelligence") {
                        Text("Convert any position into a defensible, data-backed advantage.")
                            .font(.subheadline)
                            .foregroundColor(StanceTheme.textSecondary)
                            .lineSpacing(3)
                        
                        Button(action: { showNewAnalysis = true }) {
                            HStack {
                                Image(systemName: "sparkles")
                                Text("New Analysis")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(StanceTheme.primaryGradient)
                            .cornerRadius(12)
                        }
                        .padding(.top, 8)
                    }
                    
                    if claims.isEmpty {
                        SpotifyCard(title: "No Active Stances", subtitle: "Start your first analysis") {
                            Text("Stance will construct the strongest possible case for your position.")
                                .font(.subheadline)
                                .foregroundColor(StanceTheme.textSecondary)
                        }
                    } else {
                        SectionHeader("Recent Analyses")
                        
                        LazyVStack(spacing: 12) {
                            ForEach(claims.prefix(5)) { claim in
                                NavigationLink(destination: AnalysisDetailView(claim: claim)) {
                                    AnalysisRowView(claim: claim)
                                        .padding()
                                        .background(StanceTheme.surfaceElevated)
                                        .cornerRadius(16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(StanceTheme.surfaceHighlight, lineWidth: 1)
                                        )
                                }
                                .buttonStyle(.plain)
                                .contextMenu {
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
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 120)
            }
            .background(StanceTheme.background.ignoresSafeArea())
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
