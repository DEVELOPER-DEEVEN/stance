import Foundation

struct ConfidenceCalculator {
    
    /// Calculates overall advocacy strength based on weighted evidence
    static func calculate(evidence: [Evidence], parameters: [Parameter]) -> Double {
        guard !evidence.isEmpty else { return 0.5 }
        
        // Evidence confidence average
        let evidenceScore = evidence.reduce(0.0) { $0 + $1.confidence } / Double(evidence.count)
        
        // Parameter supportiveness ratio
        let supportiveCount = parameters.filter { $0.isSupportive }.count
        let parameterScore = parameters.isEmpty ? 0.5 : Double(supportiveCount) / Double(parameters.count)
        
        // Weighted combination (60% evidence, 40% parameters)
        let combined = (evidenceScore * 0.6) + (parameterScore * 0.4)
        
        // Clamp to 0.0 - 1.0
        return min(max(combined, 0.0), 1.0)
    }
}
