//
//  StationInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class StationInfoPage: CommonPage {
    
    private lazy var stationImage: XCUIElement = {
        app.images["stationImage"]
    }()
    
    private lazy var okayButton: XCUIElement = {
        app.buttons["okayButton"]
    }()
    
    private lazy var stationNameLabel: XCUIElement = {
        app.staticTexts["stationNameLabel"]
    }()
    
    private lazy var stationDeskLabel: XCUIElement = {
        app.staticTexts["stationDeskLabel"]
    }()
    
    private lazy var stationTextView: XCUIElement = {
        app.textViews["stationTextView"]
    }()
    
    private let stationDescDescription = "The Music Starts Here"
    private let textViewDescription = "All your favorite country hits and artists, from Johnny Cash to Taylor Swift, on 1.FM's Absolute Country, playing non-stop crooners and banjos, dance-tunes and fiddles, ballads and harmonicas. Absolute Country focuses on 5th, 6th and 7th generation Country (from the 90s on) but often delves into classic, older tunes as well."
    
    @discardableResult
    func tapOnOkay() -> Self {
        okayButton.tapElement()
        return self
    }
    
    @discardableResult
    func checkTextInNavbarButton(stationName: String) -> Self {
        return self
    }
    
    @discardableResult
    func checkStationImage() -> Self {
        stationImage.checkExistence(true)
        return self
    }
    
    @discardableResult
    func checkStationNameLabel(stationName: String) -> Self {
        stationNameLabel.checkLabelEqualToString(stationName)
        return self
    }
    
    @discardableResult
    func checkStationDeskLabel() -> Self {
        stationDeskLabel.checkLabelEqualToString(stationDescDescription)
        return self
    }
    
}
