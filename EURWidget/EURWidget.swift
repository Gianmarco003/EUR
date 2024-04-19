//
//  EURWidget.swift
//  EURWidget
//
//  Created by Gianmarco Zecchinato on 17/04/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date(), widgetData: [0,0], configuration: ConfigurationAppIntent())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> DayEntry {
        DayEntry(date: Date(), widgetData: [0,0], configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<DayEntry> {
        var entries: [DayEntry] = []
        let userDefaults = UserDefaults(suiteName: "group.WidgetTunnel")
        let widgetData = userDefaults?.value(forKey: "WidgetTunnel")

        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(date: startOfDate, widgetData: widgetData as! [Double], configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .never)
    }
}

struct DayEntry: TimelineEntry {
    let date: Date
    let widgetData: [Double]
    let configuration: ConfigurationAppIntent
}

struct EURWidgetEntryView : View {
    var entry: DayEntry
    
    var body: some View {
        HStack (alignment: .center) {
            VStack(alignment: .center) {
                Text(entry.date.formatted(.dateTime.month(.wide)))
                    .font(.body)
                    .textCase(.uppercase)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(entry.widgetData[WidgetData.deltaByMonth], specifier: "%.f")%")
                    .font(.system(size: 45, weight: .heavy))
                    .fontWeight(.bold)
                    .foregroundColor(entry.widgetData[WidgetData.deltaByMonth].isLess(than: 0) ? .red : .accent)
                Spacer()
                Text("€ \(entry.widgetData[WidgetData.totalByMonth], specifier: "%.2f")")
                    .font(.system(size: 20, weight: .heavy))
                    .fontWeight(.bold)
                    .foregroundColor(entry.widgetData[WidgetData.totalByMonth].isLess(than: 0) ? .red : .accent)
            }
        }
    }
}

struct EURWidget: Widget {
    let kind: String = "EURWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            EURWidgetEntryView(entry: entry)
                .containerBackground(.windowBackground, for: .widget)
        }
        .configurationDisplayName("Month")
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    EURWidget()
} timeline: {
    DayEntry(date: .now, widgetData: [9999,99], configuration: .smiley)
    DayEntry(date: .now, widgetData: [-9999,-99], configuration: .starEyes)
}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
