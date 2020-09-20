//
//  SmokeTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import Foundation

class SmokeTest: CommonTest {
    
    private let mainPage = MainPage()
    private let stationDetailsPage = StationDetailsPage()
    private let stationInfoPage = StationInfoPage()
    private let appInfoPage = AppInfoPage()
    private let radioInfoPage = RadioInfoPage()
    
    func testPlayStation() {
        mainPage
            .checkPlayButton(text: "Choose a station above to begin")
            .nowPlayingButtonIsExist(isExist: false)
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnBackButton()
        mainPage
            .nowPlayingButtonIsExist(isExist: true)
    }
    
    func testPauseStation() {
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnPlay()
            .checkSongPauseLabel()
    }
    
    func testStopStation() {
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnStop()
            .checkSongStoppedLabel()
    }
    
    func testOpenStationDetailsByTapOnNowPlayingButton() {
        let nameOfStation = mainPage.getStationName(indexOfStation: 0)
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnBackButton()
        mainPage
            .tapOnNowPlayingButton()
        stationDetailsPage
            .checkNavbarTitle(stationName: nameOfStation)
    }
    
    func testOpenWebsiteFromAppInfo() {
        mainPage
            .tapOnInfoButton()
        appInfoPage
            .openWebsite()
            .checkMainDomain(domain: "github.com")
    }
    
    func testOpenAboutFromAppInfo() {
        mainPage
            .tapOnInfoButton()
        appInfoPage
            .openAbout()
        
    }
    
    func testStationInfo() {
        mainPage.tapOnStation(index: 0)
        stationDetailsPage.tapOnInfoButton()
    }
    
}
