//
//  SwiftRadioTests.swift
//  SwiftRadioTests
//
//  Created by Lysikov Boris on 03.11.2024.
//  Copyright © 2024 matthewfecher.com. All rights reserved.
//

import Testing
import AllureSwiftTesting

struct SwiftRadioTests {

    @Test(.allureId(1234), .epic("Example"), .severity(.normal))
    func example() async throws {
        #expect(2 > 1)
    }
}
