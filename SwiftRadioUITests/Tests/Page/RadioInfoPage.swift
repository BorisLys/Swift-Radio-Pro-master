//
//  RadioInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

final class RadioInfoPage: CommonPage {
        
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
    
    @discardableResult
    func logoIsExist() {

    }
    
    @discardableResult
    func versionIsExist() {
        
    }
    
    @discardableResult
    func nameOfAppIsExist() {
        
    }
    
    @discardableResult
    func textViewIsExist() {
        
    }

}
