//
//  CommonPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

class CommonPage {
    
    let app = XCUIApplication()
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    private lazy var backButton: XCUIElement = {
         app.navigationBars.children(matching: .button).firstMatch
     }()
    
    private lazy var URL: XCUIElement = {
        app.buttons["URL"]
    }()
    
    @discardableResult
    func checkMainDomain(domain: String) -> Self {
                XCTAssertTrue((URL.firstMatch.value as! String).contains(domain), "\(domain) not found")
        return self
    }
    
    @discardableResult
    func tapOnBackButton() -> Self {
        backButton.tapElement()
        return self
    }
    
}
