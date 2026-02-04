import SwiftUI

struct SpotifyCard<Content: View>: View {
    let title: String
    let subtitle: String?
    let content: Content
    
    init(title: String, subtitle: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(StanceTheme.textPrimary)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(StanceTheme.textSecondary)
                }
            }
            content
        }
        .padding(18)
        .background(StanceTheme.surfaceElevated)
        .cornerRadius(StanceTheme.cornerRadiusLarge)
        .overlay(
            RoundedRectangle(cornerRadius: StanceTheme.cornerRadiusLarge)
                .stroke(StanceTheme.surfaceHighlight, lineWidth: 1)
        )
    }
}
