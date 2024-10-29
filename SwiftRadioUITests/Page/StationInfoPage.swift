//
//  StationInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

struct StationInfoPage: BaseScreen, NavigationBar {
    
    static let stationImage = app.images["stationImage"]
    static let stationNameLabel = app.staticTexts["stationNameLabel"]
    static let okayButton = app.buttons["okayButton"]
    static let stationDeskLabel = app.staticTexts["stationDeskLabel"]
    static let stationTextView = app.textViews["stationTextView"]
        
    private let stationDescDescription = "The Music Starts Here"
    private let textViewDescription = "All your favorite country hits and artists, from Johnny Cash to Taylor Swift, on 1.FM's Absolute Country, playing non-stop crooners and banjos, dance-tunes and fiddles, ballads and harmonicas. Absolute Country focuses on 5th, 6th and 7th generation Country (from the 90s on) but often delves into classic, older tunes as well."
    
}
