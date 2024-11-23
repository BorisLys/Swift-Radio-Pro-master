//
//  XCUIElement+Waiting.swift
//  SwiftRadioUITests
//
//  Created by Lysikov Boris on 22.10.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest

extension XCUIElement {
    /// The period of time in seconds to wait explicitly for expectations.
    static let waitTimeout: TimeInterval = 5

    enum ElementEvent: String {
        case enabled = "enabled == true"
        case disabled = "enabled == false"
        case exists = "exists == true"
        case hidden = "exists == false"
        case hittable = "hittable == true"
        case unhittable = "hittable == false"
        case existsAndEnabled = "exists == true AND enabled == true"
        case existAndHittable = "exists == true AND hittable == true"
        case existHittableAndEnabled =
            "exists == true AND hittable == true AND enabled == true"
    }

    func wait(
        for event: ElementEvent = .hittable,
        time: TimeInterval = waitTimeout,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expectation = makeWaitExpectation(event: event)
        let waitResult = XCTWaiter.wait(for: [expectation], timeout: time)

        switch waitResult {
        case .timedOut:
            let element: XCUIElement = self
            let errorMessage =
                "Элемент: \(element) - недоступен в течении \(time) секунд"
            XCTFail(errorMessage, file: file, line: line)
        case .interrupted:
            XCTFail(
                "Ожидание элемента прервано до того, как оно оправдалось или неоправдалось по истечении \(time) секунд",
                file: file,
                line: line
            )
        case .incorrectOrder:
            XCTFail(
                "Ожидания не были выполнены в требуемом порядке",
                file: file,
                line: line
            )
        case .invertedFulfillment:
            XCTFail("Было выполнено инвертированное ожидание")
        case .completed:
            break
        default:
            break
        }
    }

    private func makeWaitExpectation(event: ElementEvent) -> XCTNSPredicateExpectation {
        let predicate = NSPredicate(format: event.rawValue)
        return XCTNSPredicateExpectation(predicate: predicate, object: self)
    }
}
