//
//  TestObserver.swift
//  SwiftRadioUITests
//
//  Created by Lysikov Boris on 17.11.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import XCTest

class TestObserver: NSObject, XCTestObservation {
    
    override init() {
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }
    
    func testBundleWillStart(_ testBundle: Bundle) {
        print("Начало выполнения всех тестов.")
    }
    
    func testSuiteWillStart(_ testSuite: XCTestSuite) {
        print("Начало выполнения тестов в секции: \(testSuite.name).")
    }
    
    func testCaseWillStart(_ testCase: XCTestCase) {
        print("Тест начнётся: \(testCase.name)")
    }
    
    func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
        print("Тест \(testCase.name) упал с ошибкой: \(description) в \(filePath ?? "неизвестно"), строка \(lineNumber).")
    }
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        print("Тест завершился: \(testCase.name)")
    }
    
    func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        print("Набор тестов в секции \(testSuite.name) завершился.")
    }
    
    func testBundleDidFinish(_ testBundle: Bundle) {
        print("Все тесты завершены.")
        XCTestObservationCenter.shared.removeTestObserver(self)
    }
}
