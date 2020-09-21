//
//  RadioInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class RadioInfoPage: CommonPage {
    
    // MARK: - UI elements and variables
        
    private lazy var logoImage: XCUIElement = {
        app.images["logoImage"]
    }()
    
    private lazy var versionLabel: XCUIElement = {
        app.staticTexts["versionLabel"]
    }()
    
    private lazy var nameOfAppLabel: XCUIElement = {
        app.staticTexts["nameOfAppLabel"]
    }()
    
    private lazy var linkButton: XCUIElement = {
        app.buttons["linkButton"]
    }()
    
    private lazy var emailButton: XCUIElement = {
        app.buttons["emailButton"]
    }()
    
    private lazy var okayButton: XCUIElement = {
        app.buttons["okayButton"]
    }()
    
    private lazy var textView: XCUIElement = {
        app.textViews["textView"]
    }()
    
    private let versionText = "Xcode 9 / Swift 4"
    private let nameOfAppText = "Radio App"
    private let textViewText = "FEATURES: + Displays Artist, Track and Album/Station Art on lock screen.\n+ Background Audio performance\n+iTunes API integration to automatically download album art\n+ Loads and parses Icecast metadata (i.e. artist & track names)\n+ Ability to update stations from server without resubmitting to the app store.\n"
    
    // MARK: -  Actions
    
    @discardableResult
    func tapOnOkay() -> Self {
        okayButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnLink() -> Self {
        linkButton.tapElement()
        return self
    }
    
    @discardableResult
    func tapOnEmailMe() -> Self {
        emailButton.tapElement()
        return self
    }
    
    // MARK: -  Verification
    
    @discardableResult
    func checkLogo() -> Self {
        logoImage.checkExistence()
        return self
    }
    
    @discardableResult
    func checkVersion() -> Self {
        versionLabel.checkLabelEqualToString(versionText)
        return self
    }
    
    @discardableResult
    func checkNameOfApp() -> Self {
        nameOfAppLabel.checkLabelEqualToString(nameOfAppText)
        return self
    }
    
    @discardableResult
    func checkTextView() -> Self {
        textView.checkValueEqualToString(textViewText)
        return self
    }
    
}
