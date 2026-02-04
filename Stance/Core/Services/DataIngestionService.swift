import Foundation

enum ScenarioMode: String, Codable, CaseIterable, Identifiable {
    case optimistic = "Optimistic"
    case pragmatic = "Pragmatic"
    case aggressive = "Aggressive"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .optimistic: return "Maximize upside potential and growth signals."
        case .pragmatic: return "Balanced view focusing on stability and long-term viability."
        case .aggressive: return "High-risk, high-reward framing; emphasizes disruption."
        }
    }
}

/// Protocol defining the contract for fetching external data.
protocol DataIngestionService {
    /// Fetches time-series data for a specific dimension context.
    func fetchTimeSeries(for query: String, category: String, mode: ScenarioMode) async throws -> [DataPoint]
    
    /// Fetches semantic correlation signals (e.g., related concepts).
    func fetchCorrelations(for query: String) async throws -> [String]
}

struct DataPoint: Codable {
    let date: Date
    let value: Double
    let source: String
}
