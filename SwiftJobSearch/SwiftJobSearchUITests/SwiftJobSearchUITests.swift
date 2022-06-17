//
//  SwiftJobSearchUITests.swift
//  SwiftJobSearchUITests
//
//  Created by Allen Soberano on 6/8/22.
//

import XCTest

class SwiftJobSearchUITests: XCTestCase {

    var app: XCUIApplication!


    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func test_About_shouldGoToAboutViewController() throws {
        let aboutButton = app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["About"]/*[[".cells.staticTexts[\"About\"]",".staticTexts[\"About\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let detailsLabel = app.staticTexts["Project Details"]
        let frameworksLabel = app.staticTexts["Frameworks and Libraries"]
        let apiLabel = app.staticTexts["APIs"]

        if aboutButton.isSelected {
            XCTAssertTrue(detailsLabel.exists)
            XCTAssertTrue(frameworksLabel.exists)
            XCTAssertTrue(apiLabel.exists)
            XCTAssertFalse(aboutButton.exists)
        }
    }

    func test_Job_shouldGoToAboutViewController() throws {
        let jobButton = app.collectionViews.staticTexts["Job Search"]
        let navTitle = app.navigationBars["Job Search"].staticTexts["Job Search"]

        if jobButton.isSelected {
            XCTAssertTrue(navTitle.exists)
            XCTAssertFalse(jobButton.exists)
        }
    }
}
