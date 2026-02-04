import SwiftUI
import Charts

struct TrendGraph: View {
    let evidence: Evidence
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(evidence.description)
                .font(.caption)
                .foregroundColor(.gray)
            
            Chart {
                ForEach(Array(evidence.dataPoints.enumerated()), id: \.offset) { index, value in
                    LineMark(
                        x: .value("Time", index),
                        y: .value("Value", value)
                    )
                    .foregroundStyle(color)
                    .interpolationMethod(.catmullRom)
                    
                    AreaMark(
                        x: .value("Time", index),
                        y: .value("Value", value)
                    )
                    .foregroundStyle(
                        LinearGradient(
                            colors: [color.opacity(0.3), color.opacity(0.0)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(height: 60)
        }
    }
}
