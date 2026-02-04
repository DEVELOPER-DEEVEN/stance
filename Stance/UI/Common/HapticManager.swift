import UIKit

struct HapticManager {
    static let shared = HapticManager()
    
    private let impactLight = UIImpactFeedbackGenerator(style: .light)
    private let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    private let notification = UINotificationFeedbackGenerator()
    
    func playImpactLight() {
        impactLight.impactOccurred()
    }
    
    func playImpactMedium() {
        impactMedium.impactOccurred()
    }
    
    func playSuccess() {
        notification.notificationOccurred(.success)
    }
    
    func playError() {
        notification.notificationOccurred(.error)
    }
}
