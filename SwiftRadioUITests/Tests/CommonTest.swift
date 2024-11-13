//
//  CommonTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

class CommonTest: XCTestCase {
        
    override func setUp() {
        before("Иницилизация приложения") {
            super.setUp()
            
            continueAfterFailure = false
            XCUIApplication().launch()
        }
    }
    
    override func tearDown() {
        after("Очистка состояния") {
            super.tearDown()
        }
    }
}
