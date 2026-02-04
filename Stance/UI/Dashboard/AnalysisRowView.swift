import SwiftUI

struct AnalysisRowView: View {
    let claim: Claim
    
    var body: some View {
        HStack(spacing: 12) {
            // Status Indicator
            Circle()
                .fill(statusColor)
                .frame(width: 10, height: 10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(claim.originalText)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(StanceTheme.textPrimary)
                    .lineLimit(2)
                
                HStack(spacing: 8) {
                    if let mode = claim.selectedMode {
                        Text(mode.rawValue)
                            .font(.caption2)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(StanceTheme.accent.opacity(0.2))
                            .foregroundColor(StanceTheme.accent)
                            .cornerRadius(4)
                    }
                    
                    Text(claim.createdAt.formattedStanceDate())
                        .font(.caption2)
                        .foregroundColor(StanceTheme.textSecondary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(StanceTheme.textSecondary)
                .font(.caption)
        }
        .padding(.vertical, 8)
    }
    
    private var statusColor: Color {
        switch claim.status {
        case .draft:
            return .gray
        case .processing:
            return .orange
        case .complete:
            return .green
        case .error:
            return .red
        }
    }
}
