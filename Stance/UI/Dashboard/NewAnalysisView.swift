import SwiftUI

struct NewAnalysisView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var claimText: String = ""
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
                
                TextEditor(text: $claimText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(StanceTheme.surface)
                    .cornerRadius(StanceTheme.cornerRadius)
                    .frame(height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: StanceTheme.cornerRadius)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                
                Spacer()
                
                Button(action: startAnalysis) {
                    HStack {
                        if isAnalyzing {
                            ProgressView()
                                .tint(.black)
                        } else {
                            Text("Begin Advocacy")
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(claimText.isEmpty ? Color.gray : StanceTheme.textPrimary)
                    .foregroundColor(.black)
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
        }
    }
    
    private func startAnalysis() {
        isAnalyzing = true
        
        // Simulate Logic Integration
        let newClaim = Claim(originalText: claimText)
        modelContext.insert(newClaim)
        
        // In a real app, we'd trigger the ReasoningPipeline here
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isAnalyzing = false
            dismiss()
        }
    }
}

#Preview {
    NewAnalysisView()
}
