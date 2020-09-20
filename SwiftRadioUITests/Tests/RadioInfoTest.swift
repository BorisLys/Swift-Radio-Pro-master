//
//  RadioInfoTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class RadioInfoTest: CommonTest {
    
    private let mainPage = MainPage()
    private let stationDetailsPage = StationDetailsPage()
    private let radioInfoPage = RadioInfoPage()
        
    /*
     Проверка отображения элементов на экране и переход на корректную ссылку при нажатии на кнопку "matthewfetcher.com"
     */
    func testOpenWebLink() {
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnCompanyButton()
        radioInfoPage
            .checkLogo()
            .checkNameOfApp()
            .checkTextView()
            .checkVersion()
            .tapOnLink()
            .checkMainDomain(domain: "matthewfecher.com")
    }
    
    /*
     Проверка отображения алертов при нажатии на кнопку email
     */
    func testOpemEmailMeIfWeDontHaveEmail() {
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnCompanyButton()
        radioInfoPage
            .tapOnEmailMe()
        
        acceptNoMailAlert()
        acceptNoSendEMailAlert()
        
        radioInfoPage
            .checkVersion()
    }
    
    /*
     Проверка корректного закрытия текущего экрана
     */
    func testClosePage() {
        let nameOfStation = mainPage.getStationName(indexOfStation: 0)
        mainPage
            .tapOnStation(index: 0)
        stationDetailsPage
            .tapOnCompanyButton()
        radioInfoPage
            .tapOnOkay()
        stationDetailsPage
            .checkNavbarTitle(stationName: nameOfStation)
    }

}
