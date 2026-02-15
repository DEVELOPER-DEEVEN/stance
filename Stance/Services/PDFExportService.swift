import Foundation
#if canImport(UIKit)
import UIKit
#endif

struct PDFExportService {
    func export(report: AnalysisReport) -> URL? {
#if canImport(UIKit)
        let bounds = CGRect(x: 0, y: 0, width: 612, height: 792)
        let renderer = UIGraphicsPDFRenderer(bounds: bounds)
        let data = renderer.pdfData { ctx in
            ctx.beginPage()

            let titleAttrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 24)]
            let bodyAttrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 13)]

            "Stance Report".draw(at: CGPoint(x: 40, y: 40), withAttributes: titleAttrs)
            "Stance: \(report.stance)".draw(at: CGPoint(x: 40, y: 80), withAttributes: bodyAttrs)
            "Confidence: \(report.confidence)%".draw(at: CGPoint(x: 40, y: 100), withAttributes: bodyAttrs)

            report.summary.draw(in: CGRect(x: 40, y: 130, width: 532, height: 120), withAttributes: bodyAttrs)

            var y: CGFloat = 280
            for metric in report.metrics {
                "• \(metric.title): \(Int(metric.value))".draw(at: CGPoint(x: 48, y: y), withAttributes: bodyAttrs)
                y += 22
            }

            "Recommendation".draw(at: CGPoint(x: 40, y: y + 20), withAttributes: titleAttrs)
            report.recommendation.draw(in: CGRect(x: 40, y: y + 58, width: 532, height: 200), withAttributes: bodyAttrs)
        }

        let url = FileManager.default.temporaryDirectory.appendingPathComponent("Stance-\(report.id).pdf")
        try? data.write(to: url)
        return url
#else
        return nil
#endif
    }
}
