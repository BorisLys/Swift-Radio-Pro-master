//
//  XCUIElement+Actions.swift
//  SwiftRadioUITests
//
//  Created by Lysikov Boris on 22.10.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest

extension XCUIElement {
    func enterText(
        _ text: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        wait(
            file: file,
            line: line
        )
        let isElementField = elementType == .textField || elementType == .searchField || elementType == .secureTextField
        let isElementHasFocus = value(forKey: "hasKeyboardFocus") as? Bool ?? false
        switch (isElementField, isElementHasFocus) {
        case (true, true):
            clearText()
            typeText(text)
        case (true, false):
            tapElement()
            clearText()
            typeText(text)
        default:
            XCTAssert(
                true,
                "Элемент должен быть типа textField, securityTextField или searchField, но это: \(elementType.rawValue)",
                file: file,
                line: line
            )
        }
    }

    func clearText() {
        guard let stringValue = value as? String else {
            return
        }
        // workaround for apple bug
        guard placeholderValue != stringValue else {
            return
        }

        var deleteString = [String]()
        for _ in stringValue {
            deleteString.append(XCUIKeyboardKey.delete.rawValue)
        }
        typeText(deleteString.joined())
        
    }

    func tapElement(
        timeout: TimeInterval = waitTimeout,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        wait(
            for: .hittable,
            time: timeout,
            file: file,
            line: line
        )
        tap()
    }

    func tapOnCoordinate(at point: CGPoint) {
        let normalized = coordinate(withNormalizedOffset: .zero)
        let offset = CGVector(dx: point.x, dy: point.y)
        let coordinate = normalized.withOffset(offset)
        coordinate.tap()
    }

    func scrollToElement(
        _ element: XCUIElement,
        scrollLimit: Int = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        var count = 0
        while !element.isHittable && count <= scrollLimit {
            swipeUp()
            count += 1
        }
        XCTAssertFalse(
            count == scrollLimit,
            "Элемент не отображается на экране после \(count) свайпов",
            file: file,
            line: line
        )
    }

    func scrollToElementDown(
        _ element: XCUIElement,
        scrollLimit: Int = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        var count = 0
        while !element.isHittable && count <= scrollLimit {
            swipeDown()
            count += 1
        }
        XCTAssertFalse(
            count == scrollLimit,
            "Элемент не отображается на экране после \(count) свайпов",
            file: file,
            line: line
        )
    }

    func setSliderPosition(
        timeout: TimeInterval = waitTimeout,
        at position: CGFloat,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        wait(
            for: .exists,
            time: timeout,
            file: file,
            line: line
        )
        adjust(toNormalizedSliderPosition: position)
    }

    enum SwipeDirection {
        case up
        case down
        case left
        case right
    }

    func swipeScreen(direction: SwipeDirection) {
        let app = XCUIApplication()
        let bottom = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.8))
        let top = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2))
        let left = app.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.5))
        let right = app.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))

        switch direction {
        case .up:
            bottom.press(forDuration: 0, thenDragTo: top)
        case .down:
            top.press(forDuration: 0, thenDragTo: bottom)
        case .left:
            right.press(forDuration: 0, thenDragTo: left)
        case .right:
            left.press(forDuration: 0, thenDragTo: right)
        }
    }

    func closeScreenBySwipe() {
        let app = XCUIApplication()
        let left = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0.5))
        let right = app.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))

        left.press(forDuration: 1, thenDragTo: right)
    }
    
}
