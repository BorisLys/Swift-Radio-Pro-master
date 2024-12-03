//
//  CrashTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 03.12.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

final class CrashTest: CommonTest {
    
    func testCrash() {
        name("Проверка обработки краша приложения в отчете")
        
        fatalError()
        step("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
    }

}
