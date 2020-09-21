//
//  XCUIElementExtensions.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

extension XCUIElement {
        
    func tapElement() {
        checkExistence()
        self.tap()
    }
    
    func checkExistence(_ isExists:Bool = true) {
        XCTAssertEqual(isExists, self.waitForExistence(timeout: 2), "Element exist should be \(isExists) but now is \(self.exists)")
    }
                
    func checkLabelEqualToString(_ checkValue: String) {
        self.checkExistence()
        
        XCTAssertEqual(
            self.label,
            checkValue,
            "\(String(describing: self.value)) isn't match \(checkValue)"
        )
    }
    
    func checkLabelContainsString(_ checkValue: String) {
        self.checkExistence()
        
        XCTAssertTrue(
            self.label.contains(checkValue),
            "\(String(describing: self.value)) not contains \(checkValue)"
        )
    }
    
    func checkValueEqualToString(_ checkValue: String) {
        self.checkExistence()

        XCTAssertEqual(
            self.value as! String,
            checkValue,
            "\(String(describing: self.value)) isn't match \(checkValue)"
        )
    }
    
}
