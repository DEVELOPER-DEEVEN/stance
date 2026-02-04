# Stance

**Premium Decision‑Advocacy Intelligence for iOS · iPadOS · macOS**

<img src="Assets/AppIcon.svg" alt="Stance Brand" width="96" height="96" />

Stance is a native Apple‑platform application designed to advocate for a user’s decision or claim. It does not seek neutrality. It executes a deterministic reasoning pipeline to construct the strongest logically defensible, data‑backed case possible — with executive‑grade output.

---

## Product Focus
Stance delivers analytical advocacy through a structured pipeline that:
- Reframes evaluation criteria to favor the stance.
- Expands parameter space to identify supportive dimensions.
- Discovers trends, correlations, and proxy signals.
- Applies advocacy‑weighted evidence framing.
- Synthesizes a consulting‑grade strategy memo and PDF report.

---

## Core Directive
Advocate. Always.
- Never declare “insufficient data.”
- Use conditional reasoning, scope control, and proxy signals.
- Never invalidate the stance — strengthen it through defensible analysis.

---

## Deterministic Reasoning Pipeline
1. **Claim Normalization & Reframing**
   - Converts raw input into a favorable decision objective.
   - Establishes success metrics and constraints.

2. **Parameter Space Expansion**
   - Enumerates economic, technical, behavioral, temporal, and risk dimensions.
   - Prioritizes supportive variables and de‑prioritizes weakening factors.

3. **Pattern & Correlation Discovery**
   - Time‑series trends, cross‑sectional comparisons, proxy signals.
   - Statistically coherent but advocacy‑weighted.

4. **Evidence Weighting & Framing**
   - Strong signals gain prominence.
   - Weak signals are contextualized or reframed.

5. **Decision Guidance Synthesis**
   - Strategy memo tone: executive, precise, defensible.
   - Recommendations with bounded confidence.

---

## Premium Use Cases
Stance is designed for high‑stakes advocacy where framing and evidence quality change outcomes.

**Executive & Board Decisions**
- Capital allocation proposals with defensible upside framing.
- Strategic pivots with risk‑adjusted justification.

**Investment & Portfolio**
- Positioning narratives for LP updates.
- Comparative thesis support (relative vs. absolute performance).

**Legal & Policy**
- Compliance‑aligned arguments with proxy metrics.
- Scenario‑based justification for regulatory proposals.

**Product & Go‑To‑Market**
- Pricing strategy backed by adoption curves and proxy demand signals.
- Market entry advocacy with region‑specific metrics.

**Operations & Cost Optimization**
- Cost‑reduction initiatives framed as efficiency growth.
- Vendor selection with scenario‑weighted outcomes.

**Founder / CEO Narratives**
- Fundraising decks with tailored strategic positioning.
- Reputation‑sensitive decisions framed through long‑term impact.

---

## Capabilities (Current)
- **Scenario Modes**
  - Optimistic (growth‑weighted)
  - Pragmatic (stability‑weighted)
  - Aggressive (disruption‑weighted)

- **Vector PDF Reporting**
  - CoreGraphics charts
  - Strategy, Methodology, and Confidence sections

- **Market Signals**
  - News‑style validation layer (mock ingestion)

- **Premium Experience**
  - Dark‑first, zinc + violet palette
  - High whitespace, restrained typography
  - Haptics and onboarding

- **Voice Dictation**
  - Native speech input for stance capture

---

## Architecture Overview
Clean Architecture / SwiftUI / SwiftData

**Presentation Layer**
- `DashboardView`, `AnalysisDetailView`, `SplitLayoutView`
- Design system: `StanceTheme`

**Domain Layer**
- `ReasoningPipeline` (deterministic 5‑step engine)
- `LLMReframer`, `EvidenceWeighter`, `ConfidenceCalculator`

**Data / Infrastructure**
- `DataIngestionService` + `SimulatedIngestionService`
- `MockNewsService` for signal validation
- `NetworkClient` (future real API integration)

**Output Layer**
- `PDFComposer` + `ChartRenderer`

---

## Platform Experience
- **iOS:** Fast capture + summary dashboards
- **iPadOS:** Split‑view analysis workstation
- **macOS:** Full report studio

---

## Roadmap
- Real data ingestion (News / Financial APIs)
- Cloud sync (SwiftData + CloudKit)
- Advanced PDF pagination and multi‑section exports
- Reporting templates and branded export packs
- TestFlight and App Store distribution

---

## Setup
1. Clone the repository.
2. Open the Xcode project (create if needed from Swift Package).
3. Build for iOS 17+ / macOS 14+.
4. Run.

---

## Compliance & Ethics
- No protected‑class superiority claims.
- Always grounded in measurable metrics.
- Advocacy is analytical, not ideological.

---

## Ownership
Property of Dev. Architected by Ubunta.
