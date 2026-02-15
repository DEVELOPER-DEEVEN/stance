import Foundation

protocol AnalysisEngine {
    func generateReport(for stance: String) async -> AnalysisReport
}

struct MockAnalysisEngine: AnalysisEngine {
    func generateReport(for stance: String) async -> AnalysisReport {
        try? await Task.sleep(nanoseconds: 1_200_000_000)

        let trends = [
            EvidencePoint(title: "Supportive trend", value: 78, detail: "Favorable momentum in the last 24 months."),
            EvidencePoint(title: "Adoption velocity", value: 66, detail: "Higher adoption under cost-sensitive scenarios."),
            EvidencePoint(title: "Risk-adjusted edge", value: 71, detail: "Higher expected utility after volatility normalization.")
        ]

        let metrics = [
            EvidencePoint(title: "Cost Efficiency", value: 81, detail: "Better long-term value under constrained budgets."),
            EvidencePoint(title: "Operational Flexibility", value: 74, detail: "Wider execution options across contexts."),
            EvidencePoint(title: "Outcome Reliability", value: 69, detail: "Consistent performance under practical conditions.")
        ]

        return AnalysisReport(
            stance: stance,
            summary: "Under measured constraints, the stance has a defensible advantage across cost efficiency, flexibility, and execution reliability.",
            confidence: 76,
            trends: trends,
            metrics: metrics,
            recommendation: "Proceed with this stance when optimizing for long-term value and adaptable execution. Keep success criteria anchored to cost and reliability.",
            generatedAt: .now
        )
    }
}
