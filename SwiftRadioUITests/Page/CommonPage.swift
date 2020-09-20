//
//  CommonPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

class CommonPage {
    
    // MARK: - UI elements and variables
    
    let app = XCUIApplication()
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    private lazy var backButton: XCUIElement = {
         app.navigationBars.children(matching: .button).firstMatch
     }()
    
    private lazy var URL: XCUIElement = {
        app.buttons["URL"]
    }()
    
    private lazy var nameOfMainPageNavbarTitle: XCUIElement = {
        app.navigationBars.otherElements[nameOfMainPageNavbarText]
    }()
    
    private let nameOfMainPageNavbarText = "Swift Radio"
    
    // MARK: -  Actions
    
    @discardableResult
    func tapOnBackButton() -> Self {
        backButton.tapElement()
        return self
    }
    
    // MARK: -  Verification
    
    @discardableResult
    func checkLabelInBackButton(text: String) -> Self {
        backButton.checkLabelEqualToString(text)
        return self
    }
    
    @discardableResult
    func checkNavbarTitleOnMainPage() -> Self {
        nameOfMainPageNavbarTitle.checkLabelEqualToString(nameOfMainPageNavbarText)
        return self
    }
    
    @discardableResult
    func checkMainDomain(domain: String) -> Self {
        XCTAssertTrue((URL.firstMatch.value as! String).contains(domain), "\(domain) not found")
        return self
    }
    
}
