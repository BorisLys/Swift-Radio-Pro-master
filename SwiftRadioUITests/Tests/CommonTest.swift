//
//  CommonTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest
//
class CommonTest: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
        let _ = app.wait(for: .runningForeground, timeout: 5)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func addScreenshotToReport() {
        add(XCTAttachment(screenshot: XCUIScreen.main.screenshot()))
    }
}
