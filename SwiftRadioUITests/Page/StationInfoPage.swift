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
    
    @discardableResult
    func tapOnOkay() -> Self {
        okayButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnBackButton() {
        
    }
    
    @discardableResult
    func checkStationImage() {
        
    }
    
    @discardableResult
    func checkStationNameLabel() {
        
    }
    
    @discardableResult
    func checkStationDeskLabel() {
        
    }
    
}
