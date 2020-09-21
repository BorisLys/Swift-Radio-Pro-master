//
//  SmokeTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

final class SmokeTest: CommonTest {
    
    private let mainPage = MainPage()
    private let stationDetailsPage = StationDetailsPage()
    private let stationInfoPage = StationInfoPage()
    private let appInfoPage = AppInfoPage()
    private let radioInfoPage = RadioInfoPage()
    
    /*
     Проверка правильного отображения кнопки "Now Playing" в Navigation bar
     */
    func testDisplayNowPlayingButton() {
        mainPage
            .nowPlayingButtonIsExist(isExist: false)
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnBackButton()
        mainPage
            .nowPlayingButtonIsExist(isExist: true)
    }
    
    /*
     Провекра отображения выбранной станции в кнопке Play
     */
    func testDisplaySelectedStationInPlayButton() {
        let nameOfStation = mainPage.getStationName(indexOfStation: 0)
        mainPage
            .checkPlayButton(text: "Choose a station above to begin")
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnBackButton()
        mainPage
            .checkPlayButton(text: nameOfStation)
    }
    
    /*
     Проверка отображения всех элементов в ячейке
     */
    func testElementExistOnScreen() {
        mainPage
        .checkStationName(indexOfStation: 0, stationName: "Absolute Country Hits")
        .checkStationDesc(indexOfStation: 0, stationDesk: "The Music Starts Here")
        .checkStationImage(indexOfStation: 0)
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
    
    /*
     Проверка открытия правильной станции по нажатию на кнопку "Now Playing" в NavBar
     */
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
    
    /*
     Проверка открытия правильной станции по нажатию на кнопку "Play"
     */
    func testOpenStationDetailsByTapOnPlayingButton() {
        let nameOfStation = mainPage.getStationName(indexOfStation: 1)
        mainPage
            .tapOnStation(index: 1)
        stationDetailsPage
            .tapOnBackButton()
        mainPage
            .tapOnPlayButton()
        stationDetailsPage
            .checkNavbarTitle(stationName: nameOfStation)
    }
            
}
