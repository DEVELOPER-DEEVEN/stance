import WidgetKit
import SwiftUI

struct StanceEntry: TimelineEntry {
    let date: Date
    let claimText: String
    let mode: String
    let status: String
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> StanceEntry {
        StanceEntry(date: Date(), claimText: "Your Latest Stance", mode: "Optimistic", status: "Complete")
    }

    func getSnapshot(in context: Context, completion: @escaping (StanceEntry) -> Void) {
        let entry = StanceEntry(date: Date(), claimText: "Expand into new markets", mode: "Aggressive", status: "Complete")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<StanceEntry>) -> Void) {
        // In production, fetch from shared App Group container
        let entry = StanceEntry(date: Date(), claimText: "Strategic investment thesis", mode: "Optimistic", status: "Complete")
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct StanceWidgetEntryView: View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "18181B"), Color(hex: "09090B")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("STANCE")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "8B5CF6"))
                    Spacer()
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                }
                
                Text(entry.claimText)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(family == .systemSmall ? 2 : 3)
                
                Spacer()
                
                Text(entry.mode.uppercased())
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color(hex: "6366F1").opacity(0.3))
                    .foregroundColor(Color(hex: "A855F7"))
                    .cornerRadius(4)
            }
            .padding()
        }
    }
}

@main
struct StanceWidget: Widget {
    let kind: String = "StanceWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StanceWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Latest Stance")
        .description("Quick access to your most recent advocacy position.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// Color Extension (duplicated for Widget target)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6:
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
