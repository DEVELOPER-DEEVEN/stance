import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
    
    var body: some View {
        Group {
            if !isOnboardingComplete {
                OnboardingView(isOnboardingComplete: $isOnboardingComplete)
            } else {
                AppShellView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
