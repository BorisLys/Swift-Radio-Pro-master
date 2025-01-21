//
//  SafariPage.swift
//  SwiftRadioUITests
//
//  Created by Lysikov Boris on 22.10.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

/// Экран Сафари
struct SafariPage: BaseScreen {
    static let alertOpenButton = safari.otherElements["SFDialogView"].buttons.element(boundBy: 1)
    static let url = safari.textFields.firstMatch
}
