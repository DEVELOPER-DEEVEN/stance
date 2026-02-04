import Foundation
import SwiftData

@Model
final class Claim {
    var id: UUID
    var originalText: String
    var reframedText: String?
    var confidenceScore: Double // 0.0 - 1.0
    var methodology: String?
    var createdAt: Date
    var status: AnalysisStatus
    
    // Relationships
    @Relationship(deleteRule: .cascade) var parameters: [Parameter] = []
    
    init(originalText: String) {
        self.id = UUID()
        self.originalText = originalText
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
