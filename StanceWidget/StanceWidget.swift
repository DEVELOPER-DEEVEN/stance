import SwiftUI
import WidgetKit

struct StanceWidget: Widget {
    let kind: String = "StanceWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: StanceWidgetProvider()) { entry in
            StanceWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Active Stances")
        .description("See your recent advocacy analyses.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct StanceWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> StanceWidgetEntry {
        StanceWidgetEntry(date: Date(), stanceText: "Your stance here...", status: "Draft")
    }

    func getSnapshot(in context: Context, completion: @escaping (StanceWidgetEntry) -> Void) {
        let entry = StanceWidgetEntry(date: Date(), stanceText: "Sample Stance", status: "Complete")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<StanceWidgetEntry>) -> Void) {
        // In production, fetch from shared App Group container
        let entry = StanceWidgetEntry(date: Date(), stanceText: "Your active stance", status: "Complete")
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct StanceWidgetEntry: TimelineEntry {
    let date: Date
    let stanceText: String
    let status: String
}

struct StanceWidgetEntryView: View {
    var entry: StanceWidgetEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "target")
                    .foregroundColor(.purple)
                Text("Stance")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
            }
            
            Text(entry.stanceText)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
            
            Spacer()
            
            HStack {
                Circle()
                    .fill(entry.status == "Complete" ? Color.green : Color.orange)
                    .frame(width: 8, height: 8)
                Text(entry.status)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}
