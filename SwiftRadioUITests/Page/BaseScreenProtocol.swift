//
//  BaseScreenProtocol.swift
//  SwiftRadioUITests
//
//  Created by Lysikov Boris on 22.10.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest

protocol BaseScreen {
    static var app: XCUIApplication { get }
    static var safari: XCUIApplication { get }
}

protocol NavigationBar: BaseScreen {
    static var navigationBarBackButton: XCUIElement { get }
    static var navigationBarTitle: XCUIElement { get }
}

protocol Alert: BaseScreen {
    static var alertTitle: XCUIElement { get }
    static var alertDescription: XCUIElement { get }
    static var alertButton: XCUIElement { get }
}

extension BaseScreen {
    static var app: XCUIApplication {
        XCUIApplication()
    }

    static var safari: XCUIApplication {
        XCUIApplication(bundleIdentifier: BundleId.safari.rawValue)
    }
}

extension NavigationBar {
    static var navigationBarTitle: XCUIElement {
        app.navigationBars.staticTexts.firstMatch
    }
    
    static var navigationBarBackButton: XCUIElement {
        app.navigationBars.children(matching: .button).firstMatch
    }
}

extension Alert {
    static var alertTitle: XCUIElement {
        app.alerts.staticTexts.firstMatch
    }
    
    static var alertDescription: XCUIElement {
        app.alerts.staticTexts.element(boundBy: 1).firstMatch
    }
    
    static var alertButton: XCUIElement {
        app.alerts.buttons.firstMatch
    }
}
