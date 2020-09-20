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
    
    /*
     Проверка статуса - пауза для трека с радио
     */
    func testPauseStation() {
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnPlay()
            .checkSongPauseLabel()
    }
    
    /*
     Проверка статуса - стоп для трека с радио
     */
    func testStopStation() {
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnStop()
            .checkSongStoppedLabel()
    }
    
    /*
     Проверка статуса - ошибка для трека с радио
     */
    func testErrorStatusForSong() {
        mainPage
            .tapOnStation(index: 1)
        stationDetailsPage
            .checkSongErrorLabel()
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
            
}
