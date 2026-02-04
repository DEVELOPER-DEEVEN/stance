import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @AppStorage("isOnboardingComplete") var isOnboardingComplete: Bool = false
    
    var body: some View {
        Group {
            if !isOnboardingComplete {
                OnboardingView(isOnboardingComplete: $isOnboardingComplete)
            } else {
                if sizeClass == .regular {
                    SplitLayoutView()
                } else {
                    DashboardView()
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
