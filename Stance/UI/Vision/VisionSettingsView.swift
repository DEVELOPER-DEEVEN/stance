import SwiftUI

struct VisionSettingsView: View {
    @AppStorage("defaultMode") private var defaultMode: ScenarioMode = .optimistic
    @AppStorage("enableHaptics") private var enableHaptics: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "1A1026"), Color(hex: "0F0A16")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Settings")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    VisionSettingRow(title: "Default Mode", value: defaultMode.rawValue)
                    VisionToggleRow(title: "Haptic Feedback", isOn: $enableHaptics)
                }
                .padding(24)
                .padding(.bottom, 120)
            }
        }
    }
}

struct VisionSettingRow: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .foregroundColor(.white.opacity(0.6))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}

struct VisionToggleRow: View {
    let title: String
    @Binding var isOn: Bool
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
