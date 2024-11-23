//
//  RadioInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//
import Foundation
import XCTest

final class RadioInfoTest: CommonTest {
        
    func testOpenWebLink() {
        name("Открытие ссылки - matthewfetcher.com")
        description("Проверка отображения элементов на экране и переход на корректную ссылку при нажатии на кнопку matthewfetcher.com")
        severity(.blocker)
        owner("b.lysikov")
        epic("Экран инфор Радио")
        feature("Ссылка на сайт")
        story("Открытие ссылки")
        tags(["tag1", "tag2"])
        link(name: "Allure example", value: "https://allurereport.org/docs/gettingstarted-readability/#severity")

        let versionText = "Xcode 9 / Swift 4"
        let nameOfAppText = "Radio App"
        let textViewText = "FEATURES: + Displays Artist, Track and Album/Station Art on lock screen.\n+ Background Audio performance\n+iTunes API integration to automatically download album art\n+ Loads and parses Icecast metadata (i.e. artist & track names)\n+ Ability to update stations from server without resubmitting to the app store.\n"
        
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Открыть страницу компании") {
            StationDetailsPage.companyButton.tapElement()
            
            step("Проверить отображение лого") {
                RadioInfoPage.logoImage.verifyElement()
            }
            step("Проверить отображение названия приложения") {
                RadioInfoPage.nameOfAppLabel.verifyLabel(equal: nameOfAppText)
            }
            step("Проверить текст на странице") {
                RadioInfoPage.textView.verifyText(equal: textViewText)
            }
            step("Проверить версию приложения") {
                RadioInfoPage.versionLabel.verifyLabel(equal: versionText)
            }
        }
        step("Нажать на линку") {
            RadioInfoPage.linkButton.tapElement()
            
            step("Отображается корректный домен") {
                SafariPage.url.verifyText(equal: "matthewfecher.com")
            }
        }
    }
    
    func testOpemEmailMeIfWeDontHaveEmail() {
        name("Проверка отображения алерта при нажатии на кнопку email")
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Открыть страницу компании") {
            StationDetailsPage.companyButton.tapElement()
        }
        step("Нажать кнопку email") {
            RadioInfoPage.emailButton.tapElement()
            
            step("Проверить заголовок алерта") {
                RadioInfoPage.alertTitle.verifyLabel(equal: "Could Not Send Email")
            }
            step("Проверить описание алерта") {
                RadioInfoPage.alertDescription.verifyLabel(equal: "Your device could not send e-mail.  Please check e-mail configuration and try again.")
            }
        }
        step("Закрыть алерт") {
            RadioInfoPage.alertButton.tapElement()
        }
    }
    
    func testClosePage() {
        name("Проверка корректного закрытия текущего экрана")
        let nameOfStation = MainPage.getStationName(index: 0)
        
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        step("Открыть страницу компании") {
            StationDetailsPage.companyButton.tapElement()
        }
        step("Нажать кнопку окей") {
            RadioInfoPage.okayButton.tapElement()
        }
        step("Проверить название станции в навигационной панели") {
            StationDetailsPage.navigationBarTitle.verifyLabel(equal: nameOfStation)
        }
    }

}
