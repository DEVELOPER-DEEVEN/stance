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
        
        // Step 4: Weighting
        let weighter = EvidenceWeighter()
        let weightedEvidence = weighter.weight(evidence: rawEvidence)
        
        // Step 5: Synthesis
        let strategy = synthesizeStrategy(from: weightedEvidence)
        
        return AnalysisResult(
            objective: objective,
            parameters: parameters,
            evidence: weightedEvidence,
            strategy: strategy
        )
    }
    
    private func synthesizeStrategy(from evidence: [Evidence]) -> String {
        let count = evidence.count
        return "Stance has identified \(count) key supportive vectors. Primary driver is trend analysis indicating positive correlation with the proposed objective. Recommendation: Leverage economic upside metrics while contextually reframing risk factors."
    }
}

struct AnalysisResult {
    let objective: String
    let parameters: [Parameter]
    let evidence: [Evidence]
    let strategy: String
}
