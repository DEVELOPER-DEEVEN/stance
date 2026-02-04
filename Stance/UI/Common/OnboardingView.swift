import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingComplete: Bool
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            StanceTheme.background.edgesIgnoringSafeArea(.all)
            
            TabView(selection: $currentPage) {
                OnboardingPage(
                    imageName: "target",
                    title: "Define Your Stance",
                    description: "Input any decision or position. Stance does not judge; it advocates.",
                    tag: 0
                )
                
                OnboardingPage(
                    imageName: "brain.head.profile",
                    title: "Intelligence Engine",
                    description: "Our deterministic pipeline reframes metrics, discovers trends, and weights evidence in your favor.",
                    tag: 1
                )
                
                OnboardingPage(
                    imageName: "doc.text.fill",
                    title: "Strategic Advantage",
                    description: "Generate professional, data-backed PDF reports to dominate negotiations and presentations.",
                    tag: 2,
                    showButton: true,
                    action: { isOnboardingComplete = true }
                )
            }
#if os(iOS)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
#endif
        }
    }
}

struct OnboardingPage: View {
    let imageName: String
    let title: String
    let description: String
    let tag: Int
    var showButton: Bool = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundStyle(StanceTheme.primaryGradient)
                .padding()
                .background(StanceTheme.surface)
                .clipShape(Circle())
                .shadow(color: StanceTheme.accent.opacity(0.3), radius: 20, x: 0, y: 10)
            
            VStack(spacing: 12) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(StanceTheme.textPrimary)
                
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(StanceTheme.textSecondary)
                    .padding(.horizontal, 32)
            }
            
            Spacer()
            
            if showButton {
                Button(action: { action?() }) {
                    Text("Enter Stance")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(StanceTheme.primaryGradient)
                        .cornerRadius(StanceTheme.cornerRadius)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            } else {
                Spacer().frame(height: 100) // Spacer for consistency
            }
        }
        .tag(tag)
    }
}
