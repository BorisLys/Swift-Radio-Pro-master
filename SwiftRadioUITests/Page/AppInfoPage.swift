//
//  AppInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

/// Экран информации об приложении
/// - [Figma](https://www.figma.com/)
struct AppInfoPage: BaseScreen {
    static let closeButton = app.buttons["closeButton"]
    static let swiftImage = app.images["swiftImage"]
    static let aboutButton = app.buttons["aboutButton"]
    static let websiteButton = app.buttons["websiteButton"]
    static let openSourceLabel = app.staticTexts["openSourceLabel"]
    static let authorsLabel = app.staticTexts["authorsLabel"]
}
