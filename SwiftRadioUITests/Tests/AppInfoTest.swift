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
    
//    /*
//     Проверка перехода в экран о радио через текущий экран по нажатию на кнопку "About и перехода обратно"
//     */
    func testOpenAboutFromAppInfo() {
        let nameOfAppText = "Radio App"
        
        step("Нажать на кнопку инфо") {
            MainPage.navigationBarBackButton.tapElement()
        }
        step("Нажать на кнопку About") {
            AppInfoPage.aboutButton.tapElement()
            
            step("Проверить имя приложения") {
                RadioInfoPage.nameOfAppLabel.verifyLabel(equal: nameOfAppText)
            }
//            step("") {
//                <#code#>
//            }
        }

        
        
//        mainPage
//            .tapOnInfoButton()
//        appInfoPage
//            .openAbout()
//        radioInfoPage
//            .checkNameOfApp()
//            .tapOnOkay()
//        appInfoPage
//            .checkAuthors()
    }
//    
//    /*
//     Проверка корректного закрытия текущего экрана
//     */
//    func testCloseAboutAppPage() {
//        mainPage
//            .tapOnInfoButton()
//        
//        AppInfoPage.closeButton.tapElement()
//        
//        mainPage
//            .checkNavbarTitleOnMainPage()
//    }

}
