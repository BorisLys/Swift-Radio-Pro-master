//
//  StationInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
import AllureSwiftXCTest

final class StationInfoTest: CommonTest {

    func testOpenStationDetailsByTapOnNowPlayingButton() {
        allureName("Проверка отображение элементов на экране с информацией о станции, также корректную работу переходов по нажатию на кнопку назад(в Navigation bar) и ок на самом экране")
        allureSeverity(.critical)

        let stationName = MainPage.getStationName(index: 0)

        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Нажать на инфо кнопку") {
            StationDetailsPage.infoButton.tapElement()
            allureStep("Проверить отображение названия") {
                StationInfoPage.stationNameLabel.verifyLabel(equal: stationName)
            }
            allureStep("Проверить отображение картинки") {
                StationInfoPage.stationImage.verifyElement()
            }
            allureStep("Проверить отображение текста") {
                StationInfoPage.stationDeskLabel.verifyElement()
            }
        }
        allureStep("Нажать кнопку ОК") {
            StationInfoPage.okayButton.tapElement()
            allureStep("Проверить название в Navigation bar") {
                StationDetailsPage.navigationBarTitle.verifyLabel(equal: stationName)
            }
        }
        allureStep("Нажать на инфо кнопку") {
            StationDetailsPage.infoButton.tapElement()
        }
        allureStep("Нажать кнопку назад") {
            StationInfoPage.navigationBarBackButton.tapElement()
        }
        allureStep("Проверить название в Navigation bar") {
            StationDetailsPage.navigationBarTitle.verifyLabel(equal: stationName)
        }
    }
}
