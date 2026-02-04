# System Architecture

## Overview
Stance follows a **Clean Architecture** pattern adapted for modern SwiftUI. It enforces strict separation between the UI (Presentation), Logic (Domain), and Data (Infrastructure) layers.

## High-Level Modules

```mermaid
graph TD
    User[User Input] --> UI[Presentation Layer]
    UI --> Engine[StanceEngine (Domain)]
    Engine --> Pipeline[Reasoning Pipeline]
    Pipeline --> Ingestion[Data Ingestion Layer]
    Pipeline --> Frame[Reframing & Logic]
    Pipeline --> PDF[PDF Rendering Layer]
    PDF --> Report[Final PDF Output]
```

## 1. Domain Layer (Core Logic)
The brain of the application. Pure Swift. No UI dependencies.

*   **`StanceManager`**: Orchestrates the analysis flow.
*   **`ReasoningPipeline`**: The deterministic 5-step process.
    1.  `ClaimNormalizer`: Transforms input into objective metrics.
    2.  `ParameterExpander`: Searches economic, technical, and behavioral dimensions.
    3.  `PatternDiscoverer`: Time-series and correlation engine.
    4.  `EvidenceWeighter`: Applies the "Advocacy" bias weights.
    5.  `GuidanceSynthesizer`: Generates final text strategies.
*   **`Models`**:
    *   `Claim`: The user's position.
    *   `Dimension`: A parameter space (e.g., "Cost Efficiency", "Market Growth").
    *   `Evidence`: A data point or proxy signal.

## 2. Presentation Layer (UI)
SwiftUI-based, declarative, and platform-adaptive.

*   **Design System**:
    *   `StanceTheme`: Colors, Typography (San Francisco/New York), Spacing.
    *   `Components`: `StanceCard`, `TrendGraph`, `ConfidenceMeter`.
*   **Views**:
    *   `DashboardView`: List of active stances.
    *   `AnalysisView`: Real-time view of the reasoning pipeline.
    *   `ReportPreviewView`: WYSIWYG PDF preview.

## 3. Infrastructure Layer (Data)
*   **`Repository`**: Abstracted data access.
*   **`LocalStorage`**: SwiftData (CoreData) for persisting Stances and Reports.
*   **`NetworkService`**: API client for external data (Financial, News, Trends).

## 4. PDF Rendering Layer
*   **`PDFComposer`**: converting Domain Models into `PDFPage` objects.
*   **`ChartRenderer`**: Vector-based (CoreGraphics) drawing for line charts and heatmaps.
*   **`LayoutEngine`**: Handles pagination, headers, and "Consulting Memo" styling.

## Tech Stack
*   **Language**: Swift 5.10+
*   **UI Framework**: SwiftUI
*   **Concurrency**: Swift Concurrency (async/await)
*   **Persistence**: SwiftData
*   **PDF**: PDFKit + CoreGraphics

## Security & Privacy
*   Local-first processing where possible.
*   API keys stored in Keychain.
*   No telemetry sent without explicit opt-in.
