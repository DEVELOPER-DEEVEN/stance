import SwiftUI

struct LoadingPipeline: View {
    @State private var currentStep = 0
    let steps = [
        "Normalizing Stance",
        "Expanding Parameters",
        "Discovering Patterns",
        "Validating Signals",
        "Weighting Evidence",
        "Synthesizing Strategy"
    ]
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Animated Icon
            Image(systemName: "brain.head.profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundStyle(StanceTheme.primaryGradient)
                .scaleEffect(currentStep % 2 == 0 ? 1.0 : 1.1)
                .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: currentStep)
            
            Text(steps[min(currentStep, steps.count - 1)])
                .font(.headline)
                .foregroundColor(StanceTheme.textPrimary)
                .animation(.easeInOut, value: currentStep)
            
            // Progress Dots
            HStack(spacing: 8) {
                ForEach(0..<steps.count, id: \.self) { index in
                    Circle()
                        .fill(index <= currentStep ? StanceTheme.accent : StanceTheme.surface)
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut(duration: 0.3), value: currentStep)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(StanceTheme.background)
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { timer in
            if currentStep < steps.count - 1 {
                currentStep += 1
            } else {
                timer.invalidate()
            }
        }
    }
}
