//
//  MainPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

struct MainPage: BaseScreen, NavigationBar {
    static private let stationCell = "stationCell"
    
    static let nowPlayingNavbarButton = app.navigationBars.children(matching: .button).element(boundBy: 1)
    static let playbutton = app.buttons["nowPlayingButton"]
            
    static func getStation(index: Int) -> XCUIElement {
        app.cells.matching(identifier: stationCell).element(boundBy: index)
    }
    
    static func getStationName(index: Int) -> String {
        app.cells.matching(identifier: stationCell).element(boundBy: index).staticTexts["stationName"].firstMatch.label
    }
    
    static func getStationDescription(index: Int) -> XCUIElement {
        app.cells.matching(identifier: stationCell).element(boundBy: index).staticTexts["stationDesc"].firstMatch
    }
    
    static func getStationDescriptionName(index: Int) -> String {
        app.cells.matching(identifier: stationCell).element(boundBy: index).staticTexts["stationDesc"].firstMatch.label
    }
    
}
