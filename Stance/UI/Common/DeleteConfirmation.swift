import SwiftUI

struct DeleteConfirmation: ViewModifier {
    @Binding var isPresented: Bool
    let onDelete: () -> Void
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog(
                "Delete Analysis?",
                isPresented: $isPresented,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    HapticManager.shared.playError()
                    onDelete()
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This cannot be undone.")
            }
    }
}

extension View {
    func deleteConfirmation(isPresented: Binding<Bool>, onDelete: @escaping () -> Void) -> some View {
        self.modifier(DeleteConfirmation(isPresented: isPresented, onDelete: onDelete))
    }
}
