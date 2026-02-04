import SwiftUI

struct ConfidenceMeter: View {
    let confidence: Double // 0.0 - 1.0
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(label)
                    .font(.caption)
                    .foregroundColor(StanceTheme.textSecondary)
                Spacer()
                Text("\(Int(confidence * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(colorForConfidence)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background Track
                    RoundedRectangle(cornerRadius: 4)
                        .fill(StanceTheme.surface)
                        .frame(height: 8)
                    
                    // Filled Track
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [StanceTheme.primaryStart, colorForConfidence],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * confidence, height: 8)
                        .animation(.easeOut(duration: 0.5), value: confidence)
                }
            }
            .frame(height: 8)
        }
    }
    
    private var colorForConfidence: Color {
        switch confidence {
        case 0..<0.5:
            return .orange
        case 0.5..<0.75:
            return StanceTheme.accent
        default:
            return .green
        }
    }
}
