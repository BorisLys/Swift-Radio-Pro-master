//
//  SmokeTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
import AllureSwiftXCTest

final class SmokeTest: CommonTest {

    func testDisplayNowPlayingButton() {
        allureName("Проверка правильного отображения кнопки Now Playing в Navigation bar")

        allureStep("Проверить что при старте приложения кнопка play не отображается") {
            MainPage.playbutton.verifyElement(event: .disabled)
        }
        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        allureStep("Проверить что кнопка play отображается") {
            MainPage.playbutton.verifyElement()
        }
    }

    func testDisplaySelectedStationInPlayButton() {
        allureName("Проверка отображения выбранной станции в кнопке Play")

        let nameOfStation = MainPage.getStationName(index: 0)

        allureStep("Проверить отображение текста в кнопке play") {
            MainPage.playbutton.verifyLabel(equal: "Choose a station above to begin")
        }
        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        allureStep("Проверить отображение станции в кнопке play") {
            MainPage.playbutton.verifyLabelContain(contain: nameOfStation)
        }
    }

    func testElementExistOnScreen() {
        allureName("Проверка отображения всех элементов в ячейке")

        allureStep("Проверить отображение станции") {
            MainPage.getStation(index: 0).verifyLabel(equal: "Absolute Country Hits")
        }
        allureStep("Проверить отображение песни") {
            MainPage.getStationDescription(index: 0).verifyLabel(equal: "The Music Starts Here")
        }
    }

    func testPauseStation() {
        allureName("Проверка статуса - пауза для трека с радио")

        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Нажать на плей") {
            StationDetailsPage.playButton.tapElement()
        }
        allureStep("Проверить паузу") {
            StationDetailsPage.stopButton.verifyElement()
        }
    }

    func testStopStation() {
        allureName("Проверка статуса - стоп для трека с радио")

        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Нажать на стоп") {
            StationDetailsPage.stopButton.tapElement()
            allureStep("Проверить лейбл станции") {
                StationDetailsPage.songLabel.verifyLabel(equal: "Station Stopped...")
            }
        }
    }

    func testErrorStatusForSong() {
        allureName("Проверка статуса - ошибка для трека с радио")

        allureStep("Открыть вторую станцию") {
            MainPage.getStation(index: 1).tapElement()
        }
        allureStep("Проверить статус ошибки") {
            StationDetailsPage.songLabel.verifyLabel(equal: "Error Playing")
        }
    }

    func testOpenStationDetailsByTapOnNowPlayingButton() {
        allureName("Проверка открытия правильной станции по нажатию на кнопку Now Playing в NavBar")

        let nameOfStation = MainPage.getStationName(index: 0)

        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        allureStep("Нажать кнопку Play") {
            MainPage.playbutton.tapElement()
        }
        allureStep("Проверить станцию в NavBar") {
            StationDetailsPage.navigationBarTitle.verifyText(equal: nameOfStation)
        }
    }

    func testOpenStationDetailsByTapOnPlayingButton() {
        allureName("Проверка открытия правильной станции по нажатию на кнопку Play")

        let nameOfStation = MainPage.getStationName(index: 1)

        allureStep("Открыть вторую станцию") {
            MainPage.getStation(index: 1).tapElement()
        }
        allureStep("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        allureStep("Нажать на кнопку плей") {
            MainPage.playbutton.tapElement()
        }
        allureStep("Проверить название станции в NavBar") {
            MainPage.navigationBarTitle.verifyLabel(equal: nameOfStation)
        }
    }
}
