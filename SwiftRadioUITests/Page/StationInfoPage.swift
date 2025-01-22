//
//  StationInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
import SwiftRadio

/// Экран с информацией об станции
/// - [Figma](https://www.figma.com/)
struct StationInfoPage: BaseScreen, NavigationBar {
    
    typealias id = AccessibilityIDs.infoDetailView
    
    static let stationImage = app.images[id.stationImageView]
    static let stationNameLabel = app.staticTexts[id.stationNameLabel]
    static let okayButton = app.buttons[id.okayButton]
    static let stationDeskLabel = app.staticTexts[id.stationDescLabel]
    static let stationTextView = app.textViews[id.stationLongDescTextView]
}
