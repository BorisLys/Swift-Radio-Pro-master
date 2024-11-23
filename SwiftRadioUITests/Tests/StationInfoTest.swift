//
//  StationInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

final class StationInfoTest: CommonTest {
    
    func testOpenStationDetailsByTapOnNowPlayingButton() {
        name("Проверка отображение элементов на экране с информацией о станции, также корректную работу переходов по нажатию на кнопку назад(в Navigation bar) и ок на самом экране")
        severity(.critical)
        let stationName = MainPage.getStationName(index: 0)
        
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Нажать на инфо кнопку") {
            StationDetailsPage.infoButton.tapElement()
            
            step("Проверить отображение названия") {
                StationInfoPage.stationNameLabel.verifyLabel(equal: stationName)

            }
            step("Проверить отображение картинки") {
                StationInfoPage.stationImage.verifyElement()
            }
            step("Проверить отображение текста") {
                StationInfoPage.stationDeskLabel.verifyElement()
            }
        }
        step("Нажать кнопку ОК") {
            StationInfoPage.okayButton.tapElement()
            
            step("Проверить название в Navigation bar") {
                StationDetailsPage.navigationBarTitle.verifyLabel(equal: stationName)
            }
        }
        step("Нажать на инфо кнопку") {
            StationDetailsPage.infoButton.tapElement()
        }
        step("Нажать кнопку назад") {
            StationInfoPage.navigationBarBackButton.tapElement()
        }
        step("Проверить название в Navigation bar") {
            StationDetailsPage.navigationBarTitle.verifyLabel(equal: stationName)
        }

    }

}
