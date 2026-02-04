import SwiftUI

struct SectionHeader: View {
    let title: String
    let actionTitle: String?
    let action: (() -> Void)?
    
    init(_ title: String, actionTitle: String? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.actionTitle = actionTitle
        self.action = action
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(StanceTheme.textPrimary)
            Spacer()
            if let actionTitle = actionTitle, let action = action {
                Button(actionTitle, action: action)
                    .font(.caption)
                    .foregroundColor(StanceTheme.accent)
            }
        }
    }
}
