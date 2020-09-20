//
//  StationDetailsPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class StationDetailsPage: CommonPage {
    
    // MARK: - UI elements and variables
    
    enum PlayingStatus: String {
        case pause = "Station Paused"
        case stopped = "Station Stopped"
        case error = "Error Playing"
    }
        
    private lazy var albumArtImage: XCUIElement = {
        app.images["albumArtImage"]
    }()
    
    private lazy var stationDeskLabel: XCUIElement = {
        app.staticTexts["stationDeskLabel"]
    }()
    
    private lazy var playButton: XCUIElement = {
        app.buttons["playButton"]
    }()
    
    private lazy var stopButton: XCUIElement = {
        app.buttons["stopButton"]
    }()
    
    private lazy var previousButton: XCUIElement = {
        app.buttons["previousButton"]
    }()
    
    private lazy var nextButton: XCUIElement = {
        app.buttons["nextButton"]
    }()
    
    private lazy var volumeSlider: XCUIElement = {
        app.sliders["volumeSlider"]
    }()
    
    private lazy var volumeMinImage: XCUIElement = {
        app.images["volumeMinImage"]
    }()
    
    private lazy var volumeMaxImage: XCUIElement = {
        app.images["volumeMaxImage"]
    }()
    private lazy var songLabel: XCUIElement = {
        app.staticTexts["songLabel"]
    }()
    
    private lazy var artistLabel: XCUIElement = {
        app.staticTexts["artistLabel"]
    }()
    
    private lazy var companyButton: XCUIElement = {
        app.buttons["companyButton"]
    }()
    
    private lazy var shareButton: XCUIElement = {
        app.buttons["shareButton"]
    }()
    
    private lazy var infoButton: XCUIElement = {
        app.buttons["infoButton"]
    }()
    
    private lazy var airPlayView: XCUIElement = {
        app.otherElements["airPlayView"]
    }()
    
    // MARK: -  Actions
        
    @discardableResult
    func tapOnPlay() -> Self {
        playButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnStop() -> Self {
//      баг с стороны программы, если быстро нажать на стоп трек не стопорится
        stopButton.waitForExistence(timeout: 2)
        stopButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnInfoButton() -> Self {
        infoButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnCompanyButton() -> Self {
        companyButton.tapElement()
        return self
    }
    
    // MARK: -  Verification
    
    @discardableResult
    func checkSongPauseLabel() -> Self {
        songLabel.checkLabelContainsString(PlayingStatus.pause.rawValue)
        return self
    }
    
    @discardableResult
    func checkSongStoppedLabel() -> Self {
        songLabel.checkLabelContainsString(PlayingStatus.stopped.rawValue)
        return self
    }
    
    @discardableResult
    func checkSongErrorLabel() -> Self {
        songLabel.checkLabelContainsString(PlayingStatus.error.rawValue)
        return self
    }
    
    @discardableResult
    func checkNavbarTitle(stationName: String) -> Self {
        let navbarTitle: XCUIElement = {
            app.navigationBars[stationName].otherElements[stationName]
        }()
        
        navbarTitle.checkLabelEqualToString(stationName)
        return self
    }
    
}
