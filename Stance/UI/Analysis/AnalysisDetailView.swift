import SwiftUI

struct AnalysisDetailView: View {
    let claim: Claim
    @State private var showShareSheet = false
    @State private var pdfURL: URL?

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
                    
                    if let mode = claim.selectedMode {
                        Text(mode.rawValue.uppercased())
                            .font(.caption2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(StanceTheme.surface)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(StanceTheme.accent, lineWidth: 1)
                            )
                            .foregroundColor(StanceTheme.accent)
                    }
                }
                .padding()
                .background(StanceTheme.surface)
                .cornerRadius(StanceTheme.cornerRadius)
                
                // Reframing Section
                if let reframed = claim.reframedText {
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Strategic Reframing", systemImage: "arrow.triangle.2.circlepath")
                            .font(.headline)
                            .foregroundStyle(StanceTheme.primaryGradient)
                        
                        Text(reframed)
                            .font(.body)
                            .foregroundColor(StanceTheme.textPrimary)
                    }
                    .padding()
                    .background(StanceTheme.surface)
                    .cornerRadius(StanceTheme.cornerRadius)
                }
                
                // Headlines
                if !claim.relatedArticles.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Market Signals")
                            .font(.headline)
                            .foregroundColor(StanceTheme.textPrimary)
                        
                        ForEach(claim.relatedArticles) { article in
                            HStack(alignment: .top) {
                                Image(systemName: "newspaper.fill")
                                    .foregroundColor(StanceTheme.textSecondary)
                                VStack(alignment: .leading) {
                                    Text(article.title)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundColor(StanceTheme.textPrimary)
                                    Text(article.source)
                                        .font(.caption)
                                        .foregroundColor(StanceTheme.textSecondary)
                                }
                            }
                            .padding(.vertical, 4)
                            Divider().background(Color.gray.opacity(0.3))
                        }
                    }
                    .padding()
                    .background(StanceTheme.surface)
                    .cornerRadius(StanceTheme.cornerRadius)
                }
                
                // Evidence Trends
                if !claim.evidence.isEmpty {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Trend Analysis")
                            .font(.headline)
                            .foregroundColor(StanceTheme.textPrimary)
                        
                        ForEach(claim.evidence) { item in
                            VStack(alignment: .leading, spacing: 12) {
                                TrendGraph(evidence: item, color: StanceTheme.accent)
                                ConfidenceMeter(confidence: item.confidence, label: "Signal Strength")
                            }
                            .padding()
                            .background(StanceTheme.surface)
                            .cornerRadius(12)
                        }
                    }
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
                
                // Methodology
                if let methodology = claim.methodology {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Methodology & Assumptions")
                            .font(.caption)
                            .textCase(.uppercase)
                            .foregroundColor(StanceTheme.textSecondary)
                        
                        Text(methodology)
                            .font(.caption)
                            .italic()
                            .foregroundColor(StanceTheme.textSecondary)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(StanceTheme.surface)
                            .cornerRadius(StanceTheme.cornerRadius)
                    }
                }
                
                // Strategic Recommendation
                StrategyView(
                    strategy: claim.strategy ?? "Stance has identified \(claim.evidence.count) key supportive vectors. Leverage economic upside metrics while contextually reframing risk factors.",
                    confidence: claim.confidenceScore > 0 ? claim.confidenceScore : 0.82
                )
            }
            .padding()
        }
        .background(StanceTheme.background.edgesIgnoringSafeArea(.all))
        .navigationTitle("Analysis")
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: generateAndShare) {
                    Label("Export PDF", systemImage: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            if let url = pdfURL {
                ReportShareSheet(url: url)
            }
        }
    }
    
    private func generateAndShare() {
        if let url = PDFComposer.render(claim: claim) {
            self.pdfURL = url
            self.showShareSheet = true
        }
    }
}
