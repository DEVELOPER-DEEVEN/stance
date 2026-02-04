import SwiftUI

struct VisionBottomInset: ViewModifier {
    var height: CGFloat = 120
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: height)
            }
    }
}

extension View {
    func visionBottomInset(_ height: CGFloat = 120) -> some View {
        modifier(VisionBottomInset(height: height))
    }
}
