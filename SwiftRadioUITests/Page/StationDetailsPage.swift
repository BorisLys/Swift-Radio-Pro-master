//
//  StationDetailsPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

/// Экран деталей станции
/// - [Figma](https://www.figma.com/)
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
}
