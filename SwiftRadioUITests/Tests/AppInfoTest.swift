//
//  AppInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

final class AppInfoTest: CommonTest {
    
    private let mainPage = MainPage()
    private let appInfoPage = AppInfoPage()
    private let radioInfoPage = RadioInfoPage()
    
    /*
     Проверка отображения элементов на экране и переход на корректную ссылку при нажатии на кнопку "Website"
     */
    func testOpenWebsiteFromAppInfo() {
        mainPage
            .tapOnInfoButton()
        appInfoPage
            .checkAuthors()
            .checkAuthors()
            .checkImage()
            .openWebsite()
            .checkMainDomain(domain: "github.com")
    }
    
    /*
     Проверка перехода в экран о радио через текущий экран по нажатию на кнопку "About и перехода обратно"
     */
    func testOpenAboutFromAppInfo() {
        mainPage
            .tapOnInfoButton()
        appInfoPage
            .openAbout()
        radioInfoPage
            .checkNameOfApp()
            .tapOnOkay()
        appInfoPage
            .checkAuthors()
    }
    
    /*
     Проверка корректного закрытия текущего экрана
     */
    func testCloseAboutAppPage() {
        mainPage
            .tapOnInfoButton()
        appInfoPage
            .closeInfoPage()
        mainPage
            .checkNavbarTitleOnMainPage()
    }

}
