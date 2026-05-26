//
//  CrashTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 03.12.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest
import AllureSwiftXCTest

final class CrashTest: CommonTest {

    func testCrash() {
        allureName("Проверка обработки краша приложения в отчете")

        fatalError()
        allureStep("Открыть первую станцию") {
            MainPage.getStation(index: 0).tapElement()
        }
    }
}
