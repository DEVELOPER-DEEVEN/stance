import SwiftUI

struct StanceTheme {
    // Background: Zinc 950
    static let background = Color(hex: "09090B")
    static let surface = Color(hex: "18181B")
    static let surfaceElevated = Color(hex: "1F1F23")
    static let surfaceHighlight = Color(hex: "2A2A30")
    
    // Brand Gradient Colors
    static let primaryStart = Color(hex: "6366F1") // Indigo
    static let primaryMiddle = Color(hex: "8B5CF6") // Violet
    static let primaryEnd = Color(hex: "A855F7")   // Purple
    
    static let accent = primaryMiddle
    
    static let textPrimary = Color.white
    static let textSecondary = Color(hex: "A1A1AA") // Zinc 400
    static let textMuted = Color(hex: "71717A")     // Zinc 500
    
    static let cornerRadius: CGFloat = 16
    static let cornerRadiusLarge: CGFloat = 24
    static let padding: CGFloat = 20
    
    static var primaryGradient: LinearGradient {
        LinearGradient(
            colors: [primaryStart, primaryMiddle, primaryEnd],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
