//
//  AppInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

final class AppInfoTest: CommonTest {
    
    /*
     Проверка отображения элементов на экране и переход на корректную ссылку при нажатии на кнопку "Website"
     */
    func testOpenWebsiteFromAppInfo() {
        let openSourceText = "Open Source Project"
        let authorsText = "Matt Fecher & Fethi El Hassasna"
        
        step("Нажать на кнопку инфо") {
            MainPage.navigationBarBackButton.tapElement()
            
            step("Проверить Автора") {
                AppInfoPage.authorsLabel.verifyLabel(equal: authorsText)
            }
            step("Проверить наличие картиники") {
                AppInfoPage.swiftImage.verifyElement()
            }
        }
        step("Открыть веб сайт") {
            AppInfoPage.websiteButton.tapElement()
            
            step("Проверить корректный домен") {
                SafariPage.url.verifyText(equal: "github.com")
            }
        }
    }

}
