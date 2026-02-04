import SwiftUI

struct VisionInputView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    @State private var selectedMode: ScenarioMode = .optimistic
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "2B0A4A"), Color(hex: "120814")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.white.opacity(0.08))
                                .clipShape(Circle())
                        }
                        Spacer()
                        Text("STANCE")
                            .font(.caption)
                            .tracking(4)
                            .foregroundColor(.white.opacity(0.6))
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.white.opacity(0.08))
                                .clipShape(Circle())
                        }
                    }
                    
                    Text("Input Stance")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Define the parameters for today’s analysis.")
                        .foregroundColor(.white.opacity(0.7))
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            .frame(height: 180)
                        TextEditor(text: $text)
                            .scrollContentBackground(.hidden)
                            .padding(12)
                            .foregroundColor(.white)
                            .frame(height: 180)
                            .background(Color.clear)
                    }
                    
                    Text("Advocacy Aggression")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Picker("Mode", selection: $selectedMode) {
                        ForEach(ScenarioMode.allCases) { mode in
                            Text(mode.rawValue).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Button(action: {}) {
                        Text("Analyze Position")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [Color(hex: "8B5CF6"), Color(hex: "A855F7")], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(22)
                    }
                    .padding(.top, 10)
                }
                .padding(24)
            }
            .visionBottomInset(140)
        }
    }
}
