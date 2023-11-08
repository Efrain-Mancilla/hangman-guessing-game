//
//  Apple_pie_project_Mancilla_EfrainUITestsLaunchTests.swift
//  Apple_pie_project_Mancilla_EfrainUITests
//
//  Created by Efrain Mancilla on 11/2/23.
//

import XCTest

final class Apple_pie_project_Mancilla_EfrainUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
