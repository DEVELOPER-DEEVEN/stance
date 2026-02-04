import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Stance")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                ContentUnavailableView(
                    "No Stances Active",
                    systemImage: "scale.3d",
                    description: Text("Start a new analysis to advocate for your position.")
                )
                
                Spacer()
                
                Button(action: {
                    // Action to create new stance
                }) {
                    Text("New Analysis")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .padding()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    DashboardView()
}
