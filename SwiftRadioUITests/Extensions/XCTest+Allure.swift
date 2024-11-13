//
//  XCTest+Allure.swift
//  SwiftRadioUITests
//
//  Created by Lysikov Boris on 22.10.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest

public extension String {
    static let allureName = "allure.name"
    static let allureLabel = "allure.label."
    static let allureId = "AS_ID"
}

public extension XCTest {
    @discardableResult
    func allureId(_ value: String) -> XCTest {
        label(.allureId, value)
        return self
    }

    @discardableResult
    func label(_ name: String, _ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureLabel + name + ":" + value, block: { _ in })
        return self
    }

    @discardableResult
    func name(_ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureName + ":" + value, block: { _ in })
        return self
    }

    @discardableResult
    func step(_ name: String, step: () -> Void) -> XCTest {
        XCTContext.runActivity(named: "Step: " + name) { _ in
            step()
        }
        return self
    }
    
    @discardableResult
    func before(_ name: String, step: () -> Void) -> XCTest {
        XCTContext.runActivity(named: "befores: " + name) { _ in
            step()
        }
        return self
    }
    
    @discardableResult
    func after(_ name: String, step: () -> Void) -> XCTest {
        XCTContext.runActivity(named: "afters: " + name) { _ in
            step()
        }
        return self
    }
}

