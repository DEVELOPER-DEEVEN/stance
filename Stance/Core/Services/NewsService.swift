import Foundation

struct NewsArticle: Identifiable, Codable {
    var id: String { url }
    let title: String
    let source: String
    let url: String
    let publishedAt: Date
}

protocol NewsProvider {
    func fetchHeadlines(for query: String) async throws -> [NewsArticle]
}

struct MockNewsService: NewsProvider {
    
    func fetchHeadlines(for query: String) async throws -> [NewsArticle] {
        // Simulate API delay
        try? await Task.sleep(nanoseconds: 400_000_000)
        
        // Deterministic headlines based on query
        let sources = ["Bloomberg", "Financial Times", "Reuters", "The Economist"]
        let actions = ["Surges", "Outperforms", "Adopts", "Prioritizes", "Validates"]
        
        return (0..<4).map { _ in
            NewsArticle(
                title: "\(query.capitalized) \(actions.randomElement()!) Market Expectations",
                source: sources.randomElement()!,
                url: "https://example.com",
                publishedAt: Date()
            )
        }
    }
}
