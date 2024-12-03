//
//  SmokeTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

final class SmokeTest: CommonTest {
        
    func testDisplayNowPlayingButton() {
        name("Проверка правильного отображения кнопки Now Playing в Navigation bar")
        
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
    
    func testDisplaySelectedStationInPlayButton() {
        name("Проверка отображения выбранной станции в кнопке Play")
        
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
    
    func testElementExistOnScreen() {
        name("Проверка отображения всех элементов в ячейке")
        
        step("Проверить отображение станции") {
            MainPage.getStation(index: 0).verifyLabel(equal: "Absolute Country Hits")
        }
        step("Проерить отображение песни") {
            MainPage.getStationDescription(index: 0).verifyLabel(equal: "The Music Starts Here")
        }
    }
    

    func testPauseStation() {
        name("Проверка статуса - пауза для трека с радио")
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Нажать на плей") {
            StationDetailsPage.playButton.tapElement()
        }
        step("Проверить паузу") {
            StationDetailsPage.stopButton.verifyElement()
        }
    }
    
    func testStopStation() {
        name("Проверка статуса - стоп для трека с радио")
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Нажать на стоп") {
            StationDetailsPage.stopButton.tapElement()
            
            step("Проверить лейбл станции") {
                StationDetailsPage.songLabel.verifyLabel(equal: "Station Stopped...")
            }
        }
    }

    func testErrorStatusForSong() {
        name("Проверка статуса - ошибка для трека с радио")
        step("Открыть вторую станцию") {
            MainPage.getStation(index: 1).tapElement()
        }
        step("Проверить статус ошибки") {
            StationDetailsPage.songLabel.verifyLabel(equal: "Error Playing")
        }
    }
    
    func testOpenStationDetailsByTapOnNowPlayingButton() {
        name("Проверка открытия правильной станции по нажатию на кнопку Now Playing в NavBar")
        let nameOfStation = MainPage.getStationName(index: 0)
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        step("Нажать кнопку Play") {
            MainPage.playbutton.tapElement()
        }
        step("Проверить станцию в Nabbar") {
            StationDetailsPage.navigationBarTitle.verifyText(equal: nameOfStation)
        }
    }

    func testOpenStationDetailsByTapOnPlayingButton() {
        name("Проверка открытия правильной станции по нажатию на кнопку Play")
        
        let nameOfStation = MainPage.getStationName(index: 1)
        
        step("Открыть вторую станцию") {
            MainPage.getStation(index: 1).tapElement()
        }
        step("Нажать кнопку назад") {
            StationDetailsPage.navigationBarBackButton.tapElement()
        }
        step("Нажать на кнопку плей") {
            MainPage.playbutton.tapElement()
        }
        step("Проверить название станции в NavBar") {
            MainPage.navigationBarTitle.verifyLabel(equal: nameOfStation)
        }
    }
            
}
