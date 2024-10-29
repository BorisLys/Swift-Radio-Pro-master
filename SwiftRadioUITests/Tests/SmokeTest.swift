//
//  SmokeTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

final class SmokeTest: CommonTest {
        
    /*
     Проверка правильного отображения кнопки "Now Playing" в Navigation bar
     */
    func testDisplayNowPlayingButton() {
        step("Проверить что при старте приложения кнопка play не отображается") {
            MainPage.playbutton.verifyElement(event: .disabled)
        }
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        step("Проверить что кнопка play отображается") {
            MainPage.playbutton.verifyElement()
        }
    }
    
    /*
     Проверка отображения выбранной станции в кнопке Play
     */
    func testDisplaySelectedStationInPlayButton() {
        let nameOfStation = MainPage.getStationName(index: 0)
        
        step("Проверить отображение текста в кнопке play") {
            MainPage.playbutton.verifyLabel(equal: "Choose a station above to begin")
        }
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        step("Проверить отображение станции в кнопке play ") {
            MainPage.playbutton.verifyLabelContain(contain: nameOfStation)
        }
    }
    
    /*
     Проверка отображения всех элементов в ячейке
     */
    func testElementExistOnScreen() {
        step("Проверить отображение станции") {
            MainPage.getStation(index: 0).verifyLabel(equal: "Absolute Country Hits")
        }
        step("Проерить отображение песни") {
            MainPage.getStationDescription(index: 0).verifyLabel(equal: "The Music Starts Here")
        }
    }
    

//    /*
//     Проверка статуса - пауза для трека с радио
//     */
//    func testPauseStation() {
//        mainPage
//            .tapOnStation(index: 0)
//        stationDetailsPage
//            .tapOnPlay()
//            .checkSongPauseLabel()
//    }
//    
//    /*
//     Проверка статуса - стоп для трека с радио
//     */
//    func testStopStation() {
//        mainPage
//            .tapOnStation(index: 0)
//        stationDetailsPage
//            .tapOnStop()
//            .checkSongStoppedLabel()
//    }
//    
//    /*
//     Проверка статуса - ошибка для трека с радио
//     */
//    func testErrorStatusForSong() {
//        mainPage
//            .tapOnStation(index: 1)
//        stationDetailsPage
//            .checkSongErrorLabel()
//    }
//    
//    /*
//     Проверка открытия правильной станции по нажатию на кнопку "Now Playing" в NavBar
//     */
//    func testOpenStationDetailsByTapOnNowPlayingButton() {
//        let nameOfStation = mainPage.getStationName(indexOfStation: 0)
//        mainPage
//            .tapOnStation(index: 0)
//        stationDetailsPage
//            .tapOnBackButton()
//        mainPage
//            .tapOnNowPlayingButton()
//        stationDetailsPage
//            .checkNavbarTitle(stationName: nameOfStation)
//    }
//    
//    /*
//     Проверка открытия правильной станции по нажатию на кнопку "Play"
//     */
//    func testOpenStationDetailsByTapOnPlayingButton() {
//        let nameOfStation = mainPage.getStationName(indexOfStation: 1)
//        mainPage
//            .tapOnStation(index: 1)
//        stationDetailsPage
//            .tapOnBackButton()
//        mainPage
//            .tapOnPlayButton()
//        stationDetailsPage
//            .checkNavbarTitle(stationName: nameOfStation)
//    }
            
}
