//
//  RadioInfoPage.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

/// Экран с информацией о приложении радио
/// - [Figma](https://www.figma.com/)
struct RadioInfoPage: BaseScreen, Alert {
    static let versionText = "Xcode 9 / Swift 4"
    static let textViewText = "FEATURES: + Displays Artist, Track and Album/Station Art on lock screen.\n+ Background Audio performance\n+iTunes API integration to automatically download album art\n+ Loads and parses Icecast metadata (i.e. artist & track names)\n+ Ability to update stations from server without resubmitting to the app store.\n"
    
    static let logoImage = app.images["logoImage"]
    static let versionLabel = app.staticTexts["versionLabel"]
    static let nameOfAppLabel = app.staticTexts["nameOfAppLabel"]
    static let linkButton = app.buttons["linkButton"]
    static let emailButton = app.buttons["emailButton"]
    static let okayButton = app.buttons["okayButton"]
    static let textView = app.textViews["textView"]
}
