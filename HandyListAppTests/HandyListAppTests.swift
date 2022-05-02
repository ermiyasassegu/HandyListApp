//
//  HandyListAppTests.swift
//  HandyListAppTests
//
//  Created by iosdev on 8.4.2022.
//


import XCTest
import CoreData
@testable import HandyListApp

/*
 Here we avoid colliding with the app data by:
 
 - creating a new CoreDataManagerTest which sets up it's own in-memory viewContext (mainthread)
 - still doing everything on the main thread
 
 */
class ItemListViewModelTests: XCTestCase {
            
    var itemListViewModel: ItemListViewModel!
    var persistanceController: PersistenceController!

    override func setUp() {
        super.setUp()
        persistanceController = CoreDataTestStack()
        employeeManager = MediumEmployeeManager(mainContext: coreDataStack.mainContext)
    }

    func test_create_employee() {
        employeeManager.createEmployee(firstName: "Jon")
        let employee = employeeManager.fetchEmployee(withName: "Jon")!

        XCTAssertEqual("Jon", employee.firstName)
    }
        
    func test_update_employee() {
        let employee = employeeManager.createEmployee(firstName: "Jon")!
        employee.firstName = "Jonathan"
        employeeManager.updateEmployee(employee: employee)
        let updated = employeeManager.fetchEmployee(withName: "Jonathan")!
        
        XCTAssertNil(employeeManager.fetchEmployee(withName: "Jon"))
        XCTAssertEqual("Jonathan", updated.firstName)
    }

    func test_delete_employees() {

        let employeeA = employeeManager.createEmployee(firstName: "A")!
        let employeeB = employeeManager.createEmployee(firstName: "B")!
        let employeeC = employeeManager.createEmployee(firstName: "C")!

        employeeManager.deleteEmployee(employee: employeeB)

        let employees = employeeManager.fetchEmployees()!
        
        XCTAssertEqual(employees.count, 2)
        XCTAssertTrue(employees.contains(employeeA))
        XCTAssertTrue(employees.contains(employeeC))
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
