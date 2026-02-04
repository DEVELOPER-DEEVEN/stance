import Foundation

struct SimulatedIngestionService: DataIngestionService {
    
    func fetchTimeSeries(for query: String, category: String, mode: ScenarioMode) async throws -> [DataPoint] {
        // Simulate network latency
        try? await Task.sleep(nanoseconds: 300_000_000) // 0.3s
        
        let now = Date()
        let calendar = Calendar.current
        
        // Deterministic generation based on category
        let trendType = determineTrendType(category: category)
        
        return (0..<12).map { i in
            let date = calendar.date(byAdding: .month, value: -12 + i, to: now)!
            let t = Double(i) / 12.0
            let value = generateValue(t: t, type: trendType, mode: mode)
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
    
    private func generateValue(t: Double, type: TrendType, mode: ScenarioMode) -> Double {
        var baseValue: Double = 100.0
        
        // Adjust baselines and multipliers based on ScenarioMode
        let growthMultiplier: Double
        let volatilityMultiplier: Double
        
        switch mode {
        case .optimistic:
            growthMultiplier = 1.5
            volatilityMultiplier = 0.5
        case .pragmatic:
            growthMultiplier = 1.0
            volatilityMultiplier = 0.8
        case .aggressive:
            growthMultiplier = 2.0
            volatilityMultiplier = 2.0
        }
        
        switch type {
        case .growth:
            // Upward trend
            return baseValue + (t * 50 * growthMultiplier) + (sin(t * 10) * 5 * volatilityMultiplier)
        case .volatile:
            // Sine wave
            return baseValue + (sin(t * 20) * 20 * volatilityMultiplier) + (Double.random(in: -5...5) * volatilityMultiplier)
        case .plateau:
            // Logarithmic rise
            return baseValue + ((1 - exp(-5 * t)) * 50 * growthMultiplier)
        case .decline:
            // Downward, but maybe we flatten it if optimistic?
            // For advocacy, we might show a decline in "Costs" (which is good)
            return baseValue - (t * 30 * growthMultiplier)
        }
    }
}
