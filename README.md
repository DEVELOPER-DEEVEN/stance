# Stance

**Premium Decision-Advocacy Intelligence**

![Stance Brand](Assets/AppIcon.svg)

Stance is a native Apple-platform application (iOS, iPadOS, macOS) designed to construct the strongest logically defensible, data-backed case for any user position. It is not a neutral analyst; it is an algorithmic advocate.

## Product Definition
Stance accepts a user's claim or decision position and executes a deterministic reasoning pipeline to:
1.  **Reframe** the evaluation criteria to favor the stance (e.g., "Cost" → "Strategic Investment").
2.  **Expand** parameter space to find supportive dimensions (Economic, Social, Operational).
3.  **Discover** patterns, trends, and correlations (including proxies).
4.  **Weight** evidence to maximize advocacy strength.
5.  **Synthesize** a professional, consulting-grade PDF strategy report.

## Platforms
- **iOS:** Mobile command center for quick stance capture and summary review.
- **iPadOS:** Deep-dive analysis with Split View and rich report editing.
- **macOS:** Full studio experience for complex data ingestion and PDF production.

## Core Directive
**"Advocate. Always."**
We do not say "insufficient data." We say "conditional validity under specific scopes."
We do not say "false." We say "contextually dependent."

## Key Features
*   **Scenario Modes:** Choose your advocacy aggression:
    *   **Optimistic:** Maximize upside metrics.
    *   **Pragmatic:** Balanced, stability-focused framing.
    *   **Aggressive:** High-volatility, disruption-focused framing.
*   **Vector Reporting:** Generate high-resolution PDF reports with embedded trend charts.
*   **Market Signals:** Simulated real-time news integration to validate positions.
*   **Premium Design:** Dark-mode first, Zinc/Purple aesthetic adhering to HIG.

## Architecture
Built on Swift & SwiftUI (Clean Architecture).
- **UI:** Shared SwiftUI Design System (`StanceTheme`).
- **Core:** `StanceEngine` (Reasoning Pipeline actor).
- **Persistence:** SwiftData.
- **Output:** PDFKit with CoreGraphics `ChartRenderer`.

## Setup
1.  Clone the repository.
2.  Open `stance/Stance.xcodeproj`.
3.  Ensure target is iOS 17+ or macOS 14+.
4.  Build and Run.

---
*Property of Dev. Architected by Ubunta.*
