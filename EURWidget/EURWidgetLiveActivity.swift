//
//  EURWidgetLiveActivity.swift
//  EURWidget
//
//  Created by Gianmarco Zecchinato on 17/04/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EURWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct EURWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EURWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension EURWidgetAttributes {
    fileprivate static var preview: EURWidgetAttributes {
        EURWidgetAttributes(name: "World")
    }
}

extension EURWidgetAttributes.ContentState {
    fileprivate static var smiley: EURWidgetAttributes.ContentState {
        EURWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: EURWidgetAttributes.ContentState {
         EURWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: EURWidgetAttributes.preview) {
   EURWidgetLiveActivity()
} contentStates: {
    EURWidgetAttributes.ContentState.smiley
    EURWidgetAttributes.ContentState.starEyes
}
