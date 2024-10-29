//
//  StationDetailsPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

struct StationDetailsPage: BaseScreen, NavigationBar {
    
    // MARK: - UI elements and variables
    
    enum PlayingStatus: String {
        case pause = "Station Paused"
        case stopped = "Station Stopped"
        case error = "Error Playing"
    }
    
    static let albumArtImage = app.images["albumArtImage"]
    static let stationDeskLabel = app.staticTexts["stationDeskLabel"]
    static let playButton = app.buttons["playButton"]
    static let stopButton = app.buttons["stopButton"]
    static let previousButton = app.buttons["previousButton"]
    static let nextButton = app.buttons["nextButton"]
    static let volumeSlider = app.sliders["volumeSlider"]
    static let volumeMinImage = app.images["volumeMinImage"]
    static let volumeMaxImage = app.images["volumeMaxImage"]
    static let songLabel = app.staticTexts["songLabel"]
    static let artistLabel = app.staticTexts["artistLabel"]
    static let companyButton = app.buttons["companyButton"]
    static let shareButton = app.buttons["shareButton"]
    static let infoButton = app.buttons["infoButton"]
    static let airPlayView = app.otherElements["airPlayView"]
    
    // MARK: -  Actions
        
//    @discardableResult
//    func tapOnPlay() -> Self {
//        playButton.tapElement()
//        return self
//    }
//    
//    @discardableResult
//    func tapOnStop() -> Self {
////      баг с стороны программы, если быстро нажать на стоп трек не стопорится
//        stopButton.waitForExistence(timeout: 2)
//        stopButton.tapElement()
//        return self
//    }
//    
//    @discardableResult
//    func tapOnInfoButton() -> Self {
//        infoButton.tapElement()
//        return self
//    }
//    
//    @discardableResult
//    func tapOnCompanyButton() -> Self {
//        companyButton.tapElement()
//        return self
//    }
//    
//    // MARK: -  Verification
//    
//    @discardableResult
//    func checkSongPauseLabel() -> Self {
//        songLabel.checkLabelContainsString(PlayingStatus.pause.rawValue)
//        return self
//    }
//    
//    @discardableResult
//    func checkSongStoppedLabel() -> Self {
//        songLabel.checkLabelContainsString(PlayingStatus.stopped.rawValue)
//        return self
//    }
//    
//    @discardableResult
//    func checkSongErrorLabel() -> Self {
//        songLabel.checkLabelContainsString(PlayingStatus.error.rawValue)
//        return self
//    }
//    
//    @discardableResult
//    func checkNavbarTitle(stationName: String) -> Self {
//        let navbarTitle: XCUIElement = {
//            app.navigationBars[stationName].otherElements[stationName]
//        }()
//        
//        navbarTitle.checkLabelEqualToString(stationName)
//        return self
//    }
    
}
