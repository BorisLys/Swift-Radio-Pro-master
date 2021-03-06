//
//  CommonTest.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

class CommonTest: XCTestCase {
    
    let app = XCUIApplication()
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
        
    }
    
    override class func tearDown() {
        super.tearDown()
    }
}
