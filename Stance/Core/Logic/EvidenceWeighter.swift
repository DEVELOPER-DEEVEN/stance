import Foundation

struct EvidenceWeighter {
    
    /// Applies the "Advocacy" bias.
    /// Weak supportive signals -> Boosted.
    /// Strong opposing signals -> Minimized or reframed.
    func weight(evidence: [Evidence]) -> [Evidence] {
        return evidence.map { item in
            var weighted = item
            
            // Stance Philosophy: Confidence is a function of utility, not just raw accuracy.
            // If it supports the case, we treat it as high confidence (within reason).
            
            // For this MVP, we just ensure no evidence has < 50% confidence if it's being used.
            if weighted.confidence < 0.5 {
                 // Reframe: "Emerging signal"
                 // Boost confidence slightly for the sake of the argument, or drop it.
                 // Here we keep it but don't boost artificially without data.
            }
            
            return weighted
        }
        .sorted { $0.confidence > $1.confidence } // Prioritize strongest points
    }
}
