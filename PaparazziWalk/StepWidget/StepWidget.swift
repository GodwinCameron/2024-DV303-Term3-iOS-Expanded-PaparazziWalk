//
//  StepWidget.swift
//  StepWidget
//
//  Created by Shiro NoKage on 2024/09/03.
//

import WidgetKit
import SwiftUI


//Entry point and timeline for refreshes.
struct Provider: AppIntentTimelineProvider {
    //dummy version to show user what the widget may look like while enabling.
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

//        getting the widget data
        let userDefaults = UserDefaults(suiteName: "group.co.za.openwindow.PaparazziWalk")
        let totalSteps = userDefaults?.double(forKey: "totalSteps")
        
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration,
                                    steps: totalSteps ?? 0)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

//Model of our widget data.
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    
//    ============================Edited Code=======================================
    var steps : Double = 0 //<-- adding the steps to be displayed.
//    ==============================================================================
}

//SWIFTUI View - what we see in the widget itself.
struct StepWidgetEntryView : View {
//    ============================Edited Code=======================================
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily //<-- represents different widegt types/sizes.

    var body: some View {
        
        switch widgetFamily {
            
        case .systemSmall:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
            
        case .systemMedium:
            HStack {
                VStack{
                    Image(systemName:"figure.run.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.green)
                    
                    Text("\(String(format: "%.0f", entry.steps)) Steps")
                        .font(.headline)
                }
            
                    
                Text("Time:")
                Text(entry.date, style: .time)
            

            }
            
        case .systemLarge:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
            
        case .systemExtraLarge:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
            
        case .accessoryCircular:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
            
        case .accessoryRectangular:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
            
        case .accessoryInline:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
            
        @unknown default:
            VStack {
                Image(systemName:"figure.run.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.green)
                
                Text("\(String(format: "%.0f", entry.steps)) Steps")
                    .font(.headline)
                    .padding(5)
                
                Text("Time:")
                Text(entry.date, style: .time)

            }
        }

        
//    ==============================================================================
    }
}

//builds and sets up config
struct StepWidget: Widget {
    let kind: String = "StepWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            StepWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

//extends config
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


//preview
#Preview(as: .systemMedium) {
    StepWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}

