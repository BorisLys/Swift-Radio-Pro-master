//
//  SkipTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 03.12.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest

final class SkipTest: CommonTest {

    func testSkip() throws {
        name("Проверка обработки Skip теста в отчете")
        
        throw XCTSkip("Skip теста")
        step("Шаг 1") {
            MainPage.getStation(index: 0).tapElement()
        }
    }
}
