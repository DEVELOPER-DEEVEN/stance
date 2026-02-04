import Foundation

struct MockDataEngine {
    
    static func generateMetricName(category: String) -> String {
        let economicMetrics = ["ROI Projection", "Cost Efficiency Index", "Revenue Upside", "Capital Velocity"]
        let socialMetrics = ["Sentiment Score", "Brand Affinity", "Adoption Rate", "Community Trust"]
        let technicalMetrics = ["Uptime Reliability", "Processing Throughput", "Scalability Factor", "Latency Reduction"]
        let riskMetrics = ["Risk Mitigation", "Volatility Index", "Stability Score", "Compliance Adherence"]
        
        let lower = category.lowercased()
        
        if lower.contains("econom") { return economicMetrics.randomElement()! }
        if lower.contains("social") { return socialMetrics.randomElement()! }
        if lower.contains("tech") { return technicalMetrics.randomElement()! }
        if lower.contains("risk") { return riskMetrics.randomElement()! }
        
        return "Performance Metric"
    }
    
    static func generateTrajectory(mode: ScenarioMode, category: String, months: Int = 12) -> [Double] {
        var values: [Double] = []
        var current = 100.0
        
        // Configuration
        let isRisk = category.lowercased().contains("risk")
        let volatility: Double
        let trend: Double
        
        switch mode {
        case .optimistic:
            // Risk goes down, everything else goes up fast
            trend = isRisk ? -2.0 : 4.0
            volatility = 2.0
        case .pragmatic:
            // Moderate moves
            trend = isRisk ? -0.5 : 1.5
            volatility = 4.0
        case .aggressive:
            // High volatility, steep trends
            trend = isRisk ? -1.0 : 6.0
            volatility = 8.0
        }
        
        for _ in 0..<months {
            // Random Walk
            let change = trend + Double.random(in: -volatility...volatility)
            current += change
            values.append(current)
        }
        
        return values
    }
}
