import Foundation

/// The deterministic 5-step reasoning engine.
actor ReasoningPipeline {
    
    // Dependencies (injected via init in production)
    // private let ingestionService: DataIngestionService
    
    func analyze(claim: Claim) async throws -> AnalysisResult {
        // Step 1: Normalization & Reframing
        let reframer = LLMReframer()
        let objective = await reframer.reframe(claim: claim.originalText)
        
        // Update the claim model directly
        claim.reframedText = objective
        
        // Step 2: Parameter Expansion
        let expander = ParameterExpander()
        let parameters = await expander.expand(for: objective)
        
        // Step 3: Pattern Discovery
        let discoverer = PatternDiscoverer()
        let mode = claim.selectedMode ?? .optimistic
        let rawEvidence = await discoverer.discover(for: parameters, mode: mode)
        
        // Step 3.5: External Validation (News)
        let newsService = MockNewsService()
        let articles = try? await newsService.fetchHeadlines(for: claim.originalText)
        
        // Step 4: Weighting
        let weighter = EvidenceWeighter()
        let weightedEvidence = weighter.weight(evidence: rawEvidence)
        
        // Step 5: Synthesis
        let strategy = synthesizeStrategy(from: weightedEvidence)
        let methodology = generateMethodology(mode: mode)
        let confidence = ConfidenceCalculator.calculate(evidence: weightedEvidence, parameters: parameters)
        
        // Update Model
        claim.reframedText = objective
        claim.evidence = weightedEvidence
        claim.relatedArticles = articles ?? []
        claim.methodology = methodology
        claim.confidenceScore = confidence
        claim.status = .complete
        
        return AnalysisResult(
            objective: objective,
            parameters: parameters,
            evidence: weightedEvidence,
            articles: articles ?? [],
            strategy: strategy,
            methodology: methodology
        )
    }
    
    private func synthesizeStrategy(from evidence: [Evidence]) -> String {
        let count = evidence.count
        return "Stance has identified \(count) key supportive vectors. Primary driver is trend analysis indicating positive correlation with the proposed objective. Recommendation: Leverage economic upside metrics while contextually reframing risk factors."
    }
    
    private func generateMethodology(mode: ScenarioMode) -> String {
        switch mode {
        case .optimistic:
            return "Analysis assumes favorable market conditions and high adoption rates. Risk factors are weighted lower than opportunity cost."
        case .pragmatic:
            return "Analysis is based on historical averages and balanced growth projections. Volatility is accounted for within standard deviation norms."
        case .aggressive:
            return "Analysis prioritizes disruption potential and first-mover advantage. Short-term volatility is accepted in exchange for maximum long-term capture."
        }
    }
}

struct AnalysisResult {
    let objective: String
    let parameters: [Parameter]
    let evidence: [Evidence]
    let articles: [NewsArticle]
    let strategy: String
    let methodology: String
}
