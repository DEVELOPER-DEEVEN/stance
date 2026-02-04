import SwiftUI

struct AnalysisDetailView: View {
    let claim: Claim
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Advocacy Stance")
                        .font(.caption)
                        .textCase(.uppercase)
                        .foregroundColor(StanceTheme.textSecondary)
                    
                    Text(claim.originalText)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(StanceTheme.textPrimary)
                }
                .padding()
                .background(StanceTheme.surface)
                .cornerRadius(StanceTheme.cornerRadius)
                
                // Reframing Section
                if let reframed = claim.reframedText {
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Strategic Reframing", systemImage: "arrow.triangle.2.circlepath")
                            .font(.headline)
                            .foregroundColor(StanceTheme.accent)
                        
                        Text(reframed)
                            .font(.body)
                            .foregroundColor(StanceTheme.textPrimary)
                    }
                    .padding()
                    .background(StanceTheme.surface)
                    .cornerRadius(StanceTheme.cornerRadius)
                }
                
                // Parameters
                VStack(alignment: .leading, spacing: 16) {
                    Text("Supportive Dimensions")
                        .font(.headline)
                        .foregroundColor(StanceTheme.textPrimary)
                    
                    ForEach(claim.parameters) { param in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(param.name)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(StanceTheme.textPrimary)
                                Text(param.dimension)
                                    .font(.caption)
                                    .foregroundColor(StanceTheme.textSecondary)
                            }
                            Spacer()
                            Text(String(format: "%.0f%%", param.weight * 100))
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(param.isSupportive ? .green : .red)
                        }
                        .padding()
                        .background(StanceTheme.surface)
                        .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .background(StanceTheme.background.edgesIgnoringSafeArea(.all))
        .navigationTitle("Analysis")
        .navigationBarTitleDisplayMode(.inline)
    }
}
