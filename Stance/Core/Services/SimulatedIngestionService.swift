import Foundation

struct SimulatedIngestionService: DataIngestionService {
    
    func fetchTimeSeries(for query: String, category: String, mode: ScenarioMode) async throws -> [DataPoint] {
        // Simulate network latency
        try? await Task.sleep(nanoseconds: 200_000_000)
        
        let now = Date()
        let calendar = Calendar.current
        
        let values = MockDataEngine.generateTrajectory(mode: mode, category: category)
        
        return values.enumerated().map { index, value in
            let date = calendar.date(byAdding: .month, value: -12 + index, to: now)!
            return DataPoint(date: date, value: value, source: "Simulated Market Index")
        }
    }
    
    func fetchCorrelations(for query: String) async throws -> [String] {
        return ["Metric A", "Index B", "Consumer Sentiment"]
    }
}
