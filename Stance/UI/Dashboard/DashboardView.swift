import SwiftUI

struct DashboardView: View {
    @Query(sort: \Claim.createdAt, order: .reverse) var claims: [Claim]
    @State private var showNewAnalysis = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Stance")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(StanceTheme.textPrimary)
                
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
                            NavigationLink(destination: Text("Analysis for: \(claim.originalText)")) {
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
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                
                Button(action: { showNewAnalysis = true }) {
                    Text("New Analysis")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(StanceTheme.textPrimary)
                        .cornerRadius(12)
                }
                .padding()
            }
            .background(StanceTheme.background.edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $showNewAnalysis) {
                NewAnalysisView()
            }
        }
    }
}

#Preview {
    DashboardView()
}
