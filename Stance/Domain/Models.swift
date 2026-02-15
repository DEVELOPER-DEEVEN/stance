import Foundation

struct EvidencePoint: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let value: Double
    let detail: String
}

struct AnalysisReport: Identifiable, Hashable {
    let id = UUID()
    let stance: String
    let summary: String
    let confidence: Int
    let trends: [EvidencePoint]
    let metrics: [EvidencePoint]
    let recommendation: String
    let generatedAt: Date
}

enum AnalysisStep: String, CaseIterable {
    case reframing = "Framing stance"
    case parameters = "Expanding parameters"
    case patterns = "Identifying patterns"
    case weighting = "Weighting evidence"
    case synthesis = "Generating insights"
}
