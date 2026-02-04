#if os(iOS)
import UIKit

struct HapticManager {
    static let shared = HapticManager()
    
    private let impactLight = UIImpactFeedbackGenerator(style: .light)
    private let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    private let notification = UINotificationFeedbackGenerator()
    
    private var isEnabled: Bool {
        UserDefaults.standard.bool(forKey: "enableHaptics")
    }
    
    func playImpactLight() {
        if isEnabled { impactLight.impactOccurred() }
    }
    
    func playImpactMedium() {
        if isEnabled { impactMedium.impactOccurred() }
    }
    
    func playSuccess() {
        if isEnabled { notification.notificationOccurred(.success) }
    }
    
    func playError() {
        if isEnabled { notification.notificationOccurred(.error) }
    }
}
#else
import Foundation

struct HapticManager {
    static let shared = HapticManager()
    
    func playImpactLight() {}
    func playImpactMedium() {}
    func playSuccess() {}
    func playError() {}
}
#endif
