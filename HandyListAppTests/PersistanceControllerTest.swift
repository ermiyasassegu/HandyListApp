//
//  PersistanceControllerTest.swift
//  HandyListAppTests
//
//  Created by iosdev on 2.5.2022.
//

import XCTest
import CoreData
@testable import HandyListApp

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container:NSPersistentContainer
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "CD_CRUD_MVVM")
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
                                       if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
                                       }
        )
    }
}
