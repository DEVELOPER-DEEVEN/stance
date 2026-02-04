import Foundation

struct SimulatedIngestionService: DataIngestionService {
    
    func fetchTimeSeries(for query: String, category: String) async throws -> [DataPoint] {
        // Simulate network latency
        try? await Task.sleep(nanoseconds: 300_000_000) // 0.3s
        
        let now = Date()
        let calendar = Calendar.current
        
        // Deterministic generation based on category
        // "Economic" -> Growth, "Risk" -> Volatility, etc.
        let trendType = determineTrendType(category: category)
        
        return (0..<12).map { i in
            let date = calendar.date(byAdding: .month, value: -12 + i, to: now)!
            let t = Double(i) / 12.0
            let value = generateValue(t: t, type: trendType)
            return DataPoint(date: date, value: value, source: "Simulated Market Index")
        }
    }
    
    func fetchCorrelations(for query: String) async throws -> [String] {
        return ["Metric A", "Index B", "Consumer Sentiment"]
    }
    
    private enum TrendType {
        case growth
        case volatile
        case plateau
        case decline
    }
    
    private func determineTrendType(category: String) -> TrendType {
        let lower = category.lowercased()
        if lower.contains("growth") || lower.contains("market") || lower.contains("impact") { return .growth }
        if lower.contains("risk") || lower.contains("stability") { return .volatile }
        return .growth // Default to advocacy (growth)
    }
    
    private func generateValue(t: Double, type: TrendType) -> Double {
        switch type {
        case .growth:
            return 100 + (t * 50) + (sin(t * 10) * 5) // Upward with slight seasonality
        case .volatile:
            return 100 + (sin(t * 20) * 20) + (Double.random(in: -10...10))
        case .plateau:
            return 100 + (1 - exp(-5 * t)) * 50
        case .decline:
            return 100 - (t * 30)
        }
    }
}
