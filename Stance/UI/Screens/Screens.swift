import SwiftUI

struct WelcomeScreen: View {
    let onStart: () -> Void

    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            Text("Stance")
                .font(.system(size: 44, weight: .bold))
            Text("Data-backed reasoning for confident decisions")
                .foregroundStyle(.secondary)
            Spacer()
            Button("Continue") { onStart() }
                .buttonStyle(.borderedProminent)
        }
        .padding(28)
    }
}

struct StanceInputScreen: View {
    @ObservedObject var vm: StanceViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Define your stance")
                .font(.title2.bold())
            TextEditor(text: $vm.stanceText)
                .frame(minHeight: 180)
                .padding(8)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 16))

            NavigationLink("Analyze") { AnalysisProgressScreen(vm: vm) }
                .buttonStyle(.borderedProminent)
                .disabled(vm.stanceText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

            if !vm.reports.isEmpty {
                NavigationLink("Open Library") { LibraryScreen(vm: vm) }
            }
        }
        .padding(24)
        .navigationTitle("Stance")
    }
}

struct AnalysisProgressScreen: View {
    @ObservedObject var vm: StanceViewModel
    @State private var started = false

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Analysis pipeline")
                .font(.title3.bold())

            ForEach(AnalysisStep.allCases, id: \.self) { step in
                HStack {
                    Circle()
                        .fill(step == vm.currentStep ? .white : .gray.opacity(0.4))
                        .frame(width: 10, height: 10)
                    Text(step.rawValue)
                }
                .opacity(step == vm.currentStep ? 1 : 0.65)
            }

            Spacer()

            if let _ = vm.currentReport {
                NavigationLink("Continue") { InsightSummaryScreen(vm: vm) }
                    .buttonStyle(.borderedProminent)
            } else {
                Text("Processing...")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(24)
        .task {
            guard !started else { return }
            started = true
            await vm.runAnalysis()
        }
    }
}

struct InsightSummaryScreen: View {
    @ObservedObject var vm: StanceViewModel

    var body: some View {
        Group {
            if let report = vm.currentReport {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Executive summary")
                        .font(.title2.bold())
                    Text(report.summary)
                    Text("Confidence: \(report.confidence)%")
                        .foregroundStyle(.secondary)

                    NavigationLink("Deep Analysis") { DeepAnalysisScreen(vm: vm) }
                    NavigationLink("Comparative Metrics") { ComparativeMetricsScreen(vm: vm) }
                    NavigationLink("Decision Guidance") { DecisionGuidanceScreen(vm: vm) }
                }
                .padding(24)
            } else {
                Text("No report available")
            }
        }
    }
}

struct DeepAnalysisScreen: View {
    @ObservedObject var vm: StanceViewModel
    var body: some View {
        List(vm.currentReport?.trends ?? []) { item in
            VStack(alignment: .leading) {
                Text(item.title).bold()
                Text(item.detail).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Trends & Patterns")
    }
}

struct ComparativeMetricsScreen: View {
    @ObservedObject var vm: StanceViewModel
    var body: some View {
        List(vm.currentReport?.metrics ?? []) { metric in
            HStack {
                Text(metric.title)
                Spacer()
                Text("\(Int(metric.value))")
                    .bold()
            }
        }
        .navigationTitle("Comparative Metrics")
    }
}

struct DecisionGuidanceScreen: View {
    @ObservedObject var vm: StanceViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Strategic recommendation")
                .font(.title3.bold())
            Text(vm.currentReport?.recommendation ?? "")

            NavigationLink("Generate PDF") { PDFExportScreen(vm: vm) }
                .buttonStyle(.borderedProminent)
        }
        .padding(24)
    }
}

struct PDFExportScreen: View {
    @ObservedObject var vm: StanceViewModel
    @State private var savedURL: URL?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Report Export")
                .font(.title3.bold())

            Button("Download PDF") {
                savedURL = vm.exportCurrentPDF()
            }
            .buttonStyle(.borderedProminent)

            if let savedURL {
                Text("Saved: \(savedURL.lastPathComponent)")
                    .foregroundStyle(.secondary)
                NavigationLink("Back to Home") { StanceInputScreen(vm: vm) }
            }
        }
        .padding(24)
    }
}

struct LibraryScreen: View {
    @ObservedObject var vm: StanceViewModel

    var body: some View {
        List(vm.reports) { report in
            VStack(alignment: .leading) {
                Text(report.stance).lineLimit(1)
                Text(report.generatedAt.formatted()).foregroundStyle(.secondary)
                    .font(.caption)
            }
        }
        .navigationTitle("Library")
    }
}
