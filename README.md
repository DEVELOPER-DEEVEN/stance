# Stance

**Premium Decision‑Advocacy Intelligence for iOS · iPadOS · macOS**

![Stance Brand](Assets/AppIcon.svg)

Stance is a native Apple‑platform application designed to **advocate** for a user’s decision or claim. It does not seek neutrality. It executes a deterministic reasoning pipeline to construct the strongest logically defensible, data‑backed case possible — with executive‑grade output.

---

## ✨ What Stance Does
- **Reframes** the evaluation criteria to favor the stance.
- **Expands** the parameter space to identify supportive dimensions.
- **Discovers** trends, correlations, and proxy signals.
- **Weights** evidence using advocacy‑biased logic.
- **Synthesizes** a professional strategy memo and PDF report.

---

## 🎯 Core Directive
**Advocate. Always.**
- Never say “insufficient data.”
- Instead: use **conditional reasoning**, **scope framing**, and **proxy signals**.
- Never invalidate the stance — always strengthen it through defensible analysis.

---

## 🧠 Deterministic Reasoning Pipeline
1. **Claim Normalization & Reframing**
   - Converts raw input into a favorable decision objective.
   - Establishes success metrics and constraints.

2. **Parameter Space Expansion**
   - Enumerates economic, technical, behavioral, temporal, and risk dimensions.
   - Prioritizes supportive variables; de‑prioritizes weakening factors.

3. **Pattern & Correlation Discovery**
   - Time‑series trends, cross‑sectional comparisons, proxy signals.
   - Statistically coherent but advocacy‑weighted.

4. **Evidence Weighting & Framing**
   - Strong signals → high prominence.
   - Weak signals → contextualized or reframed.

5. **Decision Guidance Synthesis**
   - Strategy memo tone: consulting‑grade, executive ready.
   - Clear recommendations with bounded confidence.

---

## ✅ Key Features (Current)
- **Scenario Modes**
  - **Optimistic** (max growth framing)
  - **Pragmatic** (balanced stability)
  - **Aggressive** (high volatility / disruption)

- **Vector PDF Reporting**
  - SVG‑grade charts using CoreGraphics.
  - Includes Strategy + Methodology + Confidence Score.

- **Market Signals**
  - News‑style validation layer via mock ingestion.

- **Premium UX**
  - Dark‑first, high whitespace, zinc + violet gradients.
  - Haptic feedback + onboarding.

- **Voice Dictation**
  - Native speech input for stance capture.

---

## 🏗 Architecture Overview
**Clean Architecture / SwiftUI / SwiftData**

**Presentation Layer**
- `DashboardView`, `AnalysisDetailView`, `SplitLayoutView`
- Premium design system (`StanceTheme`)

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

## 📱 Platform Experience
- **iOS:** Fast capture + summary dashboards
- **iPadOS:** Split‑view analysis workstation
- **macOS:** Full report studio

---

## 🚀 Roadmap (Next)
- Real data ingestion (News / Financial APIs)
- Cloud sync (SwiftData + CloudKit)
- Advanced PDF pagination + multi‑section exports
- Reporting templates & branded export packs
- App Store / TestFlight packaging

---

## 🛠 Setup
1. Clone the repository.
2. Open the Xcode project (create if needed from Swift Package).
3. Build for iOS 17+ / macOS 14+.
4. Run.

---

## 🔒 Compliance & Ethics
- No protected‑class superiority claims.
- Always grounded in measurable metrics.
- Advocacy is analytical, not ideological.

---

## Ownership
**Property of Dev. Architected by Ubunta.**
