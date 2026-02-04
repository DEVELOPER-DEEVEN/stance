import SwiftUI

struct StrategyView: View {
    let strategy: String
    let confidence: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundStyle(StanceTheme.primaryGradient)
                Text("Strategic Recommendation")
                    .font(.headline)
                    .foregroundColor(StanceTheme.textPrimary)
            }
            
            // Strategy Text
            Text(strategy)
                .font(.body)
                .foregroundColor(StanceTheme.textPrimary)
                .lineSpacing(4)
            
            // Confidence Bar
            VStack(alignment: .leading, spacing: 4) {
                Text("Overall Advocacy Strength")
                    .font(.caption)
                    .foregroundColor(StanceTheme.textSecondary)
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(StanceTheme.surface)
                            .frame(height: 12)
                        
                        RoundedRectangle(cornerRadius: 6)
                            .fill(StanceTheme.primaryGradient)
                            .frame(width: geometry.size.width * confidence, height: 12)
                            .animation(.spring(response: 0.6), value: confidence)
                    }
                }
                .frame(height: 12)
                
                HStack {
                    Text("Weak")
                        .font(.caption2)
                        .foregroundColor(StanceTheme.textSecondary)
                    Spacer()
                    Text("\(Int(confidence * 100))%")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(StanceTheme.accent)
                    Spacer()
                    Text("Strong")
                        .font(.caption2)
                        .foregroundColor(StanceTheme.textSecondary)
                }
            }
        }
        .padding()
        .background(StanceTheme.surface)
        .cornerRadius(StanceTheme.cornerRadius)
    }
}
