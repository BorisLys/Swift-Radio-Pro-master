//
//  RadioInfoTestExtension.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 20.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

extension RadioInfoTest {
    
    func acceptNoMailAlert() {
        let monitor = addUIInterruptionMonitor(withDescription: "No Mail Accounts") {
            let okButton = $0.buttons.element(boundBy: 0)
            if okButton.exists {
                okButton.tapElement()
                return true
            }
            return false
        }
        app.tap()
        removeUIInterruptionMonitor(monitor)
    }
    
    func acceptNoSendEMailAlert() {
        let monitor = addUIInterruptionMonitor(withDescription: "Could Not Send Email") {
            let okButton = $0.buttons.element(boundBy: 0)
            if okButton.exists {
                okButton.tapElement()
                return true
            }
            return false
        }
        app.tap()
        removeUIInterruptionMonitor(monitor)
    }
    
}
