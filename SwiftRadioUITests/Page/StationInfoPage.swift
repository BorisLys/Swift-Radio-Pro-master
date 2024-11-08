//
//  StationInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
import SwiftRadio

struct StationInfoPage: BaseScreen, NavigationBar {
    
    typealias id = AccessibilityIDs.infoDetailView
    
    static let stationImage = app.images[id.stationImageView]
    static let stationNameLabel = app.staticTexts[id.stationNameLabel]
    static let okayButton = app.buttons[id.okayButton]
    static let stationDeskLabel = app.staticTexts[id.stationDescLabel]
    static let stationTextView = app.textViews[id.stationLongDescTextView]
        
    private let stationDescDescription = "The Music Starts Here"
    private let textViewDescription = "All your favorite country hits and artists, from Johnny Cash to Taylor Swift, on 1.FM's Absolute Country, playing non-stop crooners and banjos, dance-tunes and fiddles, ballads and harmonicas. Absolute Country focuses on 5th, 6th and 7th generation Country (from the 90s on) but often delves into classic, older tunes as well."
    
}
