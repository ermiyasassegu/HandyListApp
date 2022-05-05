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


