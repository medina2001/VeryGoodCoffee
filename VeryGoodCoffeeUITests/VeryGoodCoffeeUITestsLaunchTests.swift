//
//  VeryGoodCoffeeUITestsLaunchTests.swift
//  VeryGoodCoffeeUITests
//
//  Created by Gabriel Maciel on 11/18/25.
//

import XCTest

final class VeryGoodCoffeeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
