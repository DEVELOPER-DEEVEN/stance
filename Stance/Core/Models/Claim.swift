import Foundation
import SwiftData

@Model
final class Claim {
    var id: UUID
    var originalText: String
    var reframedText: String?
    var confidenceScore: Double // 0.0 - 1.0
    var methodology: String?
    var selectedMode: ScenarioMode?
    var createdAt: Date
    var status: AnalysisStatus
    
    // Relationships
    @Relationship(deleteRule: .cascade) var parameters: [Parameter] = []
    
    // Non-persisted (transient) analysis results for the session
    // In a real app, we'd persist these as a separate entity 'AnalysisReport'
    @Transient var evidence: [Evidence] = []
    
    init(originalText: String, mode: ScenarioMode = .optimistic) {
        self.id = UUID()
        self.originalText = originalText
        self.selectedMode = mode
        self.confidenceScore = 0.0
        self.createdAt = Date()
        self.status = .draft
    }
}

enum AnalysisStatus: String, Codable {
    case draft
    case processing
    case complete
    case error
}
