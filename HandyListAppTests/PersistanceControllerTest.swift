//
//  PersistanceControllerTest.swift
//  HandyListAppTests
//
//  Created by iosdev on 2.5.2022.
//

import XCTest
import CoreData
@testable import HandyListApp

struct PersistenceControllerTest {
    
    let persistentContainer: NSPersistentContainer
        let backgroundContext: NSManagedObjectContext
        let mainContext: NSManagedObjectContext
        
        init() {
            persistentContainer = NSPersistentContainer(name: "CD_CRUD_MVVM")
            let description = persistentContainer.persistentStoreDescriptions.first
            description?.type = NSInMemoryStoreType
            
            persistentContainer.loadPersistentStores { description, error in
                guard error == nil else {
                    fatalError("was unable to load store \(error!)")
                }
            }
            
            mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            mainContext.automaticallyMergesChangesFromParent = true
            mainContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator

            backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            backgroundContext.parent = self.mainContext
        }
}
