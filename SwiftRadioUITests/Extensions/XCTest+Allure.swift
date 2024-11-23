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
    static let allureLink = "allure.link."
    static let allureDescription = "allure.description"
    static let allureId = "AS_ID"
    static let epic = "epic"
    static let feature = "feature"
    static let story = "story"
    static let severity = "severity"
    static let tag = "tag"
    static let owner = "owner"
}

public extension XCTest {
    
    // allureId - For TestOps
    @discardableResult
    func allureId(_ value: String) -> XCTest {
        label(.allureId, value)
        return self
    }
    
    @discardableResult
    func epic(_ value: String) -> XCTest {
        label(.epic, value)
        return self
    }
    
    @discardableResult
    func owner(_ value: String) -> XCTest {
        label(.owner, value)
        return self
    }
    
    @discardableResult
    func feature(_ value: String) -> XCTest {
        label(.feature, value)
        return self
    }
    
    @discardableResult
    func story(_ value: String) -> XCTest {
        label(.story, value)
        return self
    }

    
    @discardableResult
    internal func severity(_ value: Severity) -> XCTest {
        label(.severity, value.rawValue)
        return self
    }
    
    @discardableResult
    func tags(_ values: [String]) -> XCTest {
        values.forEach { value in
            label(.tag, value)
        }
        return self
    }
    
    @discardableResult
    func link(name: String, value: String) -> XCTest {
        XCTContext.runActivity(named: .allureLink + name + ":" + value, block: { _ in })
        return self

    }
    
    @discardableResult
    func name(_ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureName + ":" + value, block: { _ in })
        return self
    }
    
    @discardableResult
    func description(_ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureDescription + ":" + value, block: { _ in })
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
    private func label(_ name: String, _ value: String) -> XCTest {
        XCTContext.runActivity(named: .allureLabel + name + ":" + value, block: { _ in })
        return self
    }
}

