//
//  AppInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class AppInfoPage: CommonPage {
    
    private lazy var closeButton: XCUIElement = {
        app.buttons["closeButton"]
    }()
    
    private lazy var swiftImage: XCUIElement = {
        app.images["swiftImage"]
    }()
    
    private lazy var aboutButton: XCUIElement = {
        app.buttons["aboutButton"]
    }()
    
    private lazy var websiteButton: XCUIElement = {
        app.buttons["websiteButton"]
    }()
    
    private lazy var openSourceLabel: XCUIElement = {
        app.staticTexts["openSourceLabel"]
    }()
    
    private lazy var authorsLabel: XCUIElement = {
        app.staticTexts["authorsLabel"]
    }()
    
    @discardableResult
    func closeInfoPage() -> Self {
        closeButton.tapElement()
        return self
    }
    
    @discardableResult
    func openWebsite() -> Self {
        websiteButton.tapElement()
        return self
    }
    
    @discardableResult
    func openAbout() -> Self {
        aboutButton.tapElement()
        return self
    }
    
    @discardableResult
    func checkAuthors() {
        
    }
    
}
