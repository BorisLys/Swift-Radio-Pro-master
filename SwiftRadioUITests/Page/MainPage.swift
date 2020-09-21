//
//  MainPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class MainPage: CommonPage {
    
    // MARK: - UI elements and variables
    
    private let stationName = "stationName"
    private let stationCell = "stationCell"
    private let stationDesc = "stationDesc"
    private let stationImage = "stationImage"
    
    private lazy var infoNavbarButton: XCUIElement = {
        app.navigationBars.children(matching: .button).firstMatch
    }()
    
    private lazy var nowPlayingNavbarButton: XCUIElement = {
        app.navigationBars.children(matching: .button).element(boundBy: 1)
    }()
    
    private lazy var playbutton: XCUIElement = {
        app.buttons["nowPlayingButton"]
    }()
        
    // MARK: -  Actions
    
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
    func getStationDesk(indexOfStation: Int) -> String {
        app.cells.matching(identifier: stationCell).element(boundBy: indexOfStation).staticTexts[stationDesc].firstMatch.label
    }
    
    @discardableResult
    func getStationImage(indexOfStation: Int) -> XCUIElement {
        app.cells.matching(identifier: stationCell).element(boundBy: indexOfStation).images[stationImage].firstMatch
    }
    
    // MARK: -  Verification
    
    @discardableResult
    func checkTextInPlayingButton(text: String) -> Self {
        playbutton.checkLabelEqualToString(text)
        return self
    }
    
    @discardableResult
    func checkStationName(indexOfStation: Int, stationName: String) -> Self {
        XCTAssertEqual(getStationName(indexOfStation: indexOfStation), stationName, "\(getStationName(indexOfStation: indexOfStation)) isn't match \(stationName)")
        return self
    }
    
    @discardableResult
    func checkStationDesc(indexOfStation: Int, stationDesk: String) -> Self {
        XCTAssertEqual(getStationDesk(indexOfStation: indexOfStation), stationDesk, "\(getStationDesk(indexOfStation: indexOfStation)) isn't match \(stationDesk)")
        return self
    }
    
    @discardableResult
    func checkPlayButton(text: String) -> Self {
        playbutton.checkLabelContainsString(text)
        return self
    }
    
    @discardableResult
    func checkStationImage(indexOfStation: Int) -> Self {
        getStationImage(indexOfStation: indexOfStation).checkExistence()
        return self
    }
            
}
