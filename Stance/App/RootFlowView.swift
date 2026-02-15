import SwiftUI

@MainActor
final class StanceViewModel: ObservableObject {
    @Published var stanceText = ""
    @Published var currentStep: AnalysisStep?
    @Published var currentReport: AnalysisReport?
    @Published var reports: [AnalysisReport] = []

    private let engine: AnalysisEngine = MockAnalysisEngine()
    private let pdf = PDFExportService()

    func runAnalysis() async {
        currentReport = nil
        for step in AnalysisStep.allCases {
            currentStep = step
            try? await Task.sleep(nanoseconds: 400_000_000)
        }
        let report = await engine.generateReport(for: stanceText)
        currentReport = report
        reports.insert(report, at: 0)
        currentStep = nil
    }

    func exportCurrentPDF() -> URL? {
        guard let currentReport else { return nil }
        return pdf.export(report: currentReport)
    }
}

struct RootFlowView: View {
    @StateObject private var vm = StanceViewModel()
    @AppStorage("onboardingComplete") private var onboardingComplete = false

    var body: some View {
        NavigationStack {
            if onboardingComplete {
                StanceInputScreen(vm: vm)
            } else {
                WelcomeScreen {
                    onboardingComplete = true
                }
            }
        }
        .tint(.white)
    }
}
