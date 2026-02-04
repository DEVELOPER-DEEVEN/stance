import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var action: (() -> Void)? = nil
    var actionLabel: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundStyle(StanceTheme.primaryGradient)
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(StanceTheme.textPrimary)
                
                Text(message)
                    .font(.body)
                    .foregroundColor(StanceTheme.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            
            if let action = action, let label = actionLabel {
                Button(action: action) {
                    Text(label)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(StanceTheme.primaryGradient)
                        .cornerRadius(12)
                }
                .padding(.top, 8)
            }
        }
    }
}
