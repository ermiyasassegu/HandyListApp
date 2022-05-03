//
//  HandyListAppTests.swift
//  HandyListAppTests
//
//  Created by iosdev on 8.4.2022.
//


import XCTest
import CoreData
@testable import HandyListApp
import SwiftUI

/*
 Here we avoid colliding with the app data by:
 
 - creating a new CoreDataManagerTest which sets up it's own in-memory viewContext (mainthread)
 - still doing everything on the main thread
 
 */
class ItemListViewModelTests: XCTestCase {
            
    var itemListViewModel: ItemListViewModel!
    var persistanceController: PersistenceControllerTest!

    override func setUp() {
        super.setUp()
        persistanceController = PersistenceControllerTest()
        
    }

   func test_create_item() {

    }
        
    

   func test_delete_items() {
  }
}


//class HandyListAppTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
