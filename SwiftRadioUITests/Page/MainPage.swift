//
//  MainPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class MainPage: CommonPage {
    
    private let stationImage = "stationImage"
    private let stationName = "stationName"
    private let stationCell = "stationCell"
    private let stationDesc = "stationDesc"
    private let noneSelectedStationText = "Choose a station above to begin"
    
    private lazy var infoNavbarButton: XCUIElement = {
        app.navigationBars.children(matching: .button).firstMatch
    }()
    
    private lazy var nowPlayingNavbarButton: XCUIElement = {
        app.navigationBars.children(matching: .button).element(boundBy: 1)
    }()
    
    private lazy var playbutton: XCUIElement = {
        app.buttons["nowPlayingButton"]
    }()
        
    @discardableResult
    func tapOnStation(index: Int) -> Self {
        app.cells.matching(identifier: stationCell).element(boundBy: index).tapElement()
        return self
    }
    
    @discardableResult
    func tapOnPlayButton() -> Self {
        playbutton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnInfoButton() -> Self {
        infoNavbarButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnNowPlayingButton() -> Self {
        nowPlayingNavbarButton.tapElement()
        return self
    }
    
    @discardableResult
    func nowPlayingButtonIsExist(isExist: Bool) -> Self {
        nowPlayingNavbarButton.checkExistence(isExist)
        return self
    }
    
    @discardableResult
    func getStationName(indexOfStation: Int) -> String {
        app.cells.matching(identifier: stationCell).element(boundBy: indexOfStation).staticTexts[stationName].firstMatch.label
    }
    
    @discardableResult
    func checkTextInNowPlayingButton() {
        
    }
    
    @discardableResult
    func checkStationName() {
        
    }
    
    @discardableResult
    func checkStationDesc() {
        
    }
    
    @discardableResult
    func checkPlayButton(text: String) -> Self {
        playbutton.checkLabelEqualToString(text)
        return self
    }
    
//    @discardableResult
//    func checkPlayButtonContain(text: String) -> String {
//        playbutton
//    }
        
}
