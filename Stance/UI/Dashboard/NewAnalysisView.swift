import SwiftUI

struct NewAnalysisView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @AppStorage("defaultMode") private var defaultMode: ScenarioMode = .optimistic
    
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var claimText: String = ""
    @State private var selectedMode: ScenarioMode = .optimistic
    @State private var isAnalyzing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("What is your stance?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(StanceTheme.textPrimary)
                
                Text("Enter the position you want to advocate for. We will find the strongest data to support it.")
                    .font(.body)
                    .foregroundColor(StanceTheme.textSecondary)
                
                ZStack(alignment: .bottomTrailing) {
                    TextEditor(text: $claimText)
                        .scrollContentBackground(.hidden)
                        .padding()
                        .background(StanceTheme.surface)
                        .cornerRadius(StanceTheme.cornerRadius)
                        .frame(height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: StanceTheme.cornerRadius)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    
                    // Mic Button
                    Button(action: toggleRecording) {
                        Image(systemName: speechRecognizer.isRecording ? "waveform.circle.fill" : "mic.circle.fill")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .foregroundStyle(speechRecognizer.isRecording ? Color.red : StanceTheme.accent)
                            .background(Circle().fill(StanceTheme.background))
                    }
                    .padding(8)
                }
                
                // Scenario Mode Picker
                VStack(alignment: .leading, spacing: 12) {
                    Text("Advocacy Aggression")
                        .font(.headline)
                        .foregroundColor(StanceTheme.textPrimary)
                    
                    Picker("Mode", selection: $selectedMode) {
                        ForEach(ScenarioMode.allCases) { mode in
                            Text(mode.rawValue).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selectedMode) { _ in
                        HapticManager.shared.playImpactLight()
                    }
                    
                    Text(selectedMode.description)
                        .font(.caption)
                        .foregroundColor(StanceTheme.textSecondary)
                        .animation(.easeInOut, value: selectedMode)
                }
                
                Spacer()
                
                Button(action: startAnalysis) {
                    HStack {
                        if isAnalyzing {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text("Begin Advocacy")
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(claimText.isEmpty ? Color.gray : StanceTheme.primaryGradient)
                    .foregroundColor(.white)
                    .cornerRadius(StanceTheme.cornerRadius)
                }
                .disabled(claimText.isEmpty || isAnalyzing)
            }
            .padding(StanceTheme.padding)
            .background(StanceTheme.background.edgesIgnoringSafeArea(.all))
            .navigationTitle("New Analysis")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                speechRecognizer.requestAuthorization()
                selectedMode = defaultMode
            }
            .onChange(of: speechRecognizer.transcript) { newValue in
                if !newValue.isEmpty {
                    claimText = newValue
                }
            }
        }
    }
    
    private func toggleRecording() {
        HapticManager.shared.playImpactMedium()
        if speechRecognizer.isRecording {
            speechRecognizer.stopTranscribing()
        } else {
            speechRecognizer.startTranscribing()
        }
    }
    
    private func startAnalysis() {
        isAnalyzing = true
        
        // Simulate Logic Integration
        let newClaim = Claim(originalText: claimText, mode: selectedMode)
        modelContext.insert(newClaim)
        
        // In a real app, we'd trigger the ReasoningPipeline here
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isAnalyzing = false
            HapticManager.shared.playSuccess()
            dismiss()
        }
    }
}

#Preview {
    NewAnalysisView()
}
