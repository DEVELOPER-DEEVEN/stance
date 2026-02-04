import SwiftUI

#if canImport(UIKit)
import UIKit

struct ReportShareSheet: UIViewControllerRepresentable {
    let url: URL
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: [url], applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#elseif canImport(AppKit)
import AppKit

struct ReportShareSheet: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            let picker = NSSharingServicePicker(items: [url])
            picker.show(relativeTo: .zero, of: view, preferredEdge: .minY)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
#endif
