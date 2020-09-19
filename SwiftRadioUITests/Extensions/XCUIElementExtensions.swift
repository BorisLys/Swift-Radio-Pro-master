//
//  XCUIElementExtensions.swift
//  SwiftRadioUITests
//
//  Created by Борис Лысиков on 19.09.2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import XCTest

enum XCUIElementEvent: String {
    case enabled = "enabled == true"
    case exists = "exists == true"
    case existsAndEnabled = "exists == true AND enabled == true"
    case hidden = "exists == false"
    case disabled = "exists == true AND enabled == false"
}

extension XCUIElement {
    
    @discardableResult
    func wait(for event: XCUIElementEvent = .exists, time: TimeInterval = 10) -> XCUIElement {
        let expectation = makeWaitExpectation(event: event)
        let waitResult = XCTWaiter.wait(for: [expectation], timeout: time)
        
        XCTAssertTrue(waitResult == .completed, "Event '\(event.rawValue)' for \(self) did not happen")
        
        return self
    }
    
    private func makeWaitExpectation(event: XCUIElementEvent) -> XCTNSPredicateExpectation {
        let predicate = NSPredicate(format: event.rawValue)
        return XCTNSPredicateExpectation(predicate: predicate, object: self)
    }
    
    func checkVisibility(_ shouldBeVisible: Bool) {
        XCTAssert(self.frame.isEmpty != shouldBeVisible, "check visibility failed")
    }
            
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
