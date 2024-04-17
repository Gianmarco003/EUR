//
//  EURWidgetBundle.swift
//  EURWidget
//
//  Created by Gianmarco Zecchinato on 17/04/24.
//

import WidgetKit
import SwiftUI

@main
struct EURWidgetBundle: WidgetBundle {
    var body: some Widget {
        EURWidget()
        EURWidgetLiveActivity()
    }
}
