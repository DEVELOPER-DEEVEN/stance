import Foundation

/// Protocol defining the contract for fetching external data.
protocol DataIngestionService {
    /// Fetches time-series data for a specific dimension context.
    func fetchTimeSeries(for query: String, category: String) async throws -> [DataPoint]
    
    /// Fetches semantic correlation signals (e.g., related concepts).
    func fetchCorrelations(for query: String) async throws -> [String]
}

struct DataPoint: Codable {
    let date: Date
    let value: Double
    let source: String
}
