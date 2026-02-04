import SwiftUI

struct ContentView: View {
    var body: some View {
        DashboardView()
            .preferredColorScheme(.dark) // Premium dark mode by default
    }
}

#Preview {
    ContentView()
}
