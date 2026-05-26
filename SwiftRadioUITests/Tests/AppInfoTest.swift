//
//  AppInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
import AllureSwiftXCTest

final class AppInfoTest: CommonTest {

    let authorsText = "Matt Fecher & Fethi El Hassasna"

    func testOpenWebsiteFromAppInfo() {
        allureName("Проверка отображения элементов на экране и переход на корректную ссылку при нажатии на кнопку Website")

        allureStep("Нажать на кнопку инфо") {
            MainPage.navigationBarBackButton.tapElement()
            allureStep("Проверить Автора") {
                AppInfoPage.authorsLabel.verifyLabel(equal: authorsText)
            }
            allureStep("Проверить наличие картинки") {
                AppInfoPage.swiftImage.verifyElement()
            }
        }
        allureStep("Открыть веб сайт") {
            AppInfoPage.websiteButton.tapElement()
            allureStep("Проверить корректный домен") {
                SafariPage.url.verifyText(equal: "github.com")
            }
        }
    }
}
