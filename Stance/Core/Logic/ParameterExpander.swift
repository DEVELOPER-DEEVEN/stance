import Foundation

struct ParameterExpander {
    static let standardDimensions = [
        "Economic Impact",
        "Social Stability",
        "Technical Feasibility",
        "Legal Compliance",
        "Market Growth",
        "Operational Efficiency",
        "Brand Reputation"
    ]
    
    func expand(for objective: String) async -> [Parameter] {
        // In a real implementation, this would query an LLM
        // For now, we return a deterministic set based on keywords or random
        
        return Self.standardDimensions.map { dim in
            Parameter(
                name: "\(dim) Analysis",
                dimension: dim,
                weight: Double.random(in: 0.4...0.9),
                isSupportive: Bool.random()
            )
        }
    }
}
