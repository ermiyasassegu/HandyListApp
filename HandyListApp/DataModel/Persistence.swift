//
//  DataController.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import Foundation
import CoreData

struct PersistenceController{
    // instantiate the persistance
    static let shared = PersistenceController()
    
    let container:NSPersistentContainer
    
    //initialization
    init(inMemory: Bool = false){
        // the persistance container for the application
        container = NSPersistentContainer(name: "CD_CRUD_MVVM")
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        // load all the data from the container
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
        // error handling
                        if let error = error as NSError? {
            fatalError("Error liading Core data. \(error), \(error.userInfo)")
            }
       })
        
    }
}
