import Foundation
import SwiftData

@Model
final class Parameter {
    var id: UUID
    var name: String
    var dimension: String // e.g., "Economic", "Social"
    var weight: Double // Advocacy weight (0.0 - 1.0)
    var isSupportive: Bool
    
    // Inverse Relationship
    var claim: Claim?
    
    init(name: String, dimension: String, weight: Double = 0.5, isSupportive: Bool = true) {
        self.id = UUID()
        self.name = name
        self.dimension = dimension
        self.weight = weight
        self.isSupportive = isSupportive
    }
}
