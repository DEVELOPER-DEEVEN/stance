import SwiftUI

struct SettingsView: View {
    @AppStorage("defaultMode") private var defaultMode: ScenarioMode = .optimistic
    @AppStorage("enableHaptics") private var enableHaptics: Bool = true
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Advocacy Defaults")) {
                    Picker("Default Mode", selection: $defaultMode) {
                        ForEach(ScenarioMode.allCases) { mode in
                            Text(mode.rawValue).tag(mode)
                        }
                    }
                }
                
                Section(header: Text("Experience")) {
                    Toggle("Haptic Feedback", isOn: $enableHaptics)
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("\(AppVersion.version) (\(AppVersion.build))")
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Architect")
                        Spacer()
                        Text("Ubunta")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
