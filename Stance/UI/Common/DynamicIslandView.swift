import SwiftUI

struct DynamicIslandView: View {
    let title: String
    let subtitle: String?
    let actionTitle: String?
    let action: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(StanceTheme.textPrimary)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption2)
                        .foregroundColor(StanceTheme.textSecondary)
                }
            }
            Spacer()
            if let actionTitle = actionTitle, let action = action {
                Button(actionTitle, action: action)
                    .font(.caption)
                    .foregroundColor(StanceTheme.accent)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            Capsule()
                .fill(StanceTheme.surfaceElevated.opacity(0.95))
                .overlay(
                    Capsule().stroke(StanceTheme.surfaceHighlight, lineWidth: 1)
                )
        )
        .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
    }
}
