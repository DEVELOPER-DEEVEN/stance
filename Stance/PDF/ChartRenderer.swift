import Foundation
import CoreGraphics

struct ChartRenderer {
    
    func render(evidence: Evidence, in rect: CGRect, context: CGContext) {
        // Draw Background
        context.setFillColor(UIColor.systemGray6.cgColor)
        context.fill(rect)
        
        guard !evidence.dataPoints.isEmpty else { return }
        
        let path = CGMutablePath()
        let width = rect.width
        let height = rect.height
        let stepX = width / CGFloat(evidence.dataPoints.count - 1)
        
        let minVal = evidence.dataPoints.min() ?? 0
        let maxVal = evidence.dataPoints.max() ?? 100
        let range = maxVal - minVal
        
        // Normalize points
        let points = evidence.dataPoints.enumerated().map { index, value -> CGPoint in
            let normalizedY = (value - minVal) / (range == 0 ? 1 : range)
            let x = CGFloat(index) * stepX
            let y = height - (CGFloat(normalizedY) * height * 0.8) - (height * 0.1) // Padding
            return CGPoint(x: x, y: y)
        }
        
        path.move(to: points[0])
        for i in 1..<points.count {
            path.addLine(to: points[i])
        }
        
        // Draw Line
        context.addPath(path)
        context.setStrokeColor(UIColor.systemBlue.cgColor)
        context.setLineWidth(2.0)
        context.strokePath()
    }
}
