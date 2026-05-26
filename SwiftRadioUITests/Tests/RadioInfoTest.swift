//
//  RadioInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
import AllureSwiftXCTest

final class RadioInfoTest: CommonTest {

    func testOpenWebLink() {
        allureId(123)
        allureName("Открытие ссылки - matthewfetcher.com")
        allureDescription("Проверка отображения элементов на экране и переход на корректную ссылку при нажатии на кнопку matthewfetcher.com")
        allureSeverity(.blocker)
        allureOwner("b.lysikov")
        allureEpic("Экран инфор Радио")
        allureFeature("Ссылка на сайт")
        allureStory("Открытие ссылки")
        allureTag("tag1")
        allureTag("tag2")
        allureLink(name: "Allure example", url: "https://allurereport.org/docs/gettingstarted-readability/#severity")

        let versionText = "Xcode 9 / Swift 4"
        let nameOfAppText = "Radio App"
        let textViewText = "FEATURES: + Displays Artist, Track and Album/Station Art on lock screen.\n+ Background Audio performance\n+iTunes API integration to automatically download album art\n+ Loads and parses Icecast metadata (i.e. artist & track names)\n+ Ability to update stations from server without resubmitting to the app store.\n"

        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Открыть страницу компании") {
            StationDetailsPage.companyButton.tapElement()
            allureStep("Проверить отображение лого") {
                RadioInfoPage.logoImage.verifyElement()
            }
            allureStep("Проверить отображение названия приложения") {
                RadioInfoPage.nameOfAppLabel.verifyLabel(equal: nameOfAppText)
            }
            allureStep("Проверить текст на странице") {
                RadioInfoPage.textView.verifyText(equal: textViewText)
            }
            allureStep("Проверить версию приложения") {
                RadioInfoPage.versionLabel.verifyLabel(equal: versionText)
            }
        }
        allureStep("Нажать на линку") {
            RadioInfoPage.linkButton.tapElement()
            allureStep("Отображается корректный домен") {
                SafariPage.url.verifyText(equal: "matthewfecher.com")
            }
        }
    }

    func testOpemEmailMeIfWeDontHaveEmail() {
        allureName("Проверка отображения алерта при нажатии на кнопку email")

        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Открыть страницу компании") {
            StationDetailsPage.companyButton.tapElement()
        }
        allureStep("Нажать кнопку email") {
            RadioInfoPage.emailButton.tapElement()
            allureStep("Проверить заголовок алерта") {
                RadioInfoPage.alertTitle.verifyLabel(equal: "Could Not Send Email")
            }
            allureStep("Проверить описание алерта") {
                RadioInfoPage.alertDescription.verifyLabel(equal: "Your device could not send e-mail.  Please check e-mail configuration and try again.")
            }
        }
        allureStep("Закрыть алерт") {
            RadioInfoPage.alertButton.tapElement()
        }
    }

    func testClosePage() {
        allureName("Проверка корректного закрытия текущего экрана")

        let nameOfStation = MainPage.getStationName(index: 0)

        allureStep("Открыть первую станцию") {
            addScreenshotToReport()
            MainPage.getStation(index: 0).tapElement()
        }
        allureStep("Открыть страницу компании") {
            StationDetailsPage.companyButton.tapElement()
        }
        allureStep("Нажать кнопку окей") {
            RadioInfoPage.okayButton.tapElement()
        }
        allureStep("Проверить название станции в навигационной панели") {
            StationDetailsPage.navigationBarTitle.verifyLabel(equal: nameOfStation)
        }
    }
}
