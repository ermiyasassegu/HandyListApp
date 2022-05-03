//
//  HandyListAppUITests.swift
//  HandyListAppUITests
//
//  Created by iosdev on 8.4.2022.
//

import XCTest

// setup launcing the new item screen
class setup_launching_add_new_item_screen: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        let addItemButton = app.buttons["showAddItemButton"]
        addItemButton.tap()
    }
}
// adding new item screen test
class when_add_new_item_screen_is_presented: setup_launching_add_new_item_screen {
    
    func test_should_make_sure_screen_is_displayed() {
       
        let addTaskNavBarTitle = app.staticTexts["Add an Item"]
        XCTAssert(addTaskNavBarTitle.waitForExistence(timeout: 0.5))
        
    }
    
    func test_should_make_sure_all_required_controls_are_present() {
        
        XCTAssertTrue(app.textFields["addItemTextField"].exists)
        XCTAssertTrue(app.buttons["showAddItemButton"].exists)
    }
   // to check the dismiss model after adding new item
    func test_should_dismiss_modal_after_adding_new_item() {
        
        let itemTextField = app.textFields["addItemTextField"]
        itemTextField.tap()
        itemTextField.typeText("Banana")
        
        let addItemButton = app.buttons["addItemButton"]
        addItemButton.tap()
        
        XCTAssertTrue(addItemButton.waitForExistence(timeout: 0.5))
    }
}

// adding new item to the list and display in the itemList test
class when_adding_new_item: setup_launching_add_new_item_screen {
    
    func test_should_display_new_item_in_the_list() {
        
        let itemTextField = app.textFields["addItemTextField"]
        itemTextField.tap()
        itemTextField.typeText("Baby Wiper")
        let addItemButton = app.buttons["addItemButton"]
        addItemButton.tap()
        XCTAssertTrue(addItemButton.waitForExistence(timeout: 0.5))
        
        let itemList = app.tables["itemList"]
        let _ = itemList.waitForExistence(timeout: 0.5)
        
        let totalItems = itemList.descendants(matching: .staticText).count
        XCTAssertEqual(0, totalItems)
    }
}
    









//import XCTest
//
//class HandyListAppUITests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
//}
