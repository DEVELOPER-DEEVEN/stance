import Foundation

struct ClaimNormalizer {
    func normalize(_ text: String) -> String {
        // Simple heuristic for now
        // "I want to X" -> "Strategic Benefit of X"
        
        let lower = text.lowercased()
        if lower.starts(with: "i want to ") {
            return "Strategic Initiative: " + String(text.dropFirst(10)).capitalized
        } else if lower.starts(with: "we should ") {
            return "Policy Proposal: " + String(text.dropFirst(10)).capitalized
        }
        
        return "Advocacy Position: " + text
    }
}
