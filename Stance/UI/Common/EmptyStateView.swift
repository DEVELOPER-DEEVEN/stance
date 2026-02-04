import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var action: (() -> Void)? = nil
    var actionLabel: String? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundStyle(StanceTheme.primaryGradient)
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(StanceTheme.textPrimary)
            
            Text(message)
                .font(.body)
                .foregroundColor(StanceTheme.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            if let action = action, let label = actionLabel {
                Button(action: action) {
                    Text(label)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(StanceTheme.primaryGradient)
                        .cornerRadius(StanceTheme.cornerRadius)
                }
                .padding(.top, 8)
            }
        }
    }
}
