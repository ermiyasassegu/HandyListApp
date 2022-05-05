//
//  HandyListAppApp.swift
//  HandyListApp
//
//  Created by iosdev on 8.4.2022.
//

import SwiftUI
import Firebase

@main
struct HandyListAppApp: App {
    
    //initialize view models in the parent that eject to the enviroment and so possible to access by other views
    @StateObject var viewModel = AuthViewModel()
    
    let persistenceController = PersistenceController.shared
       
    @StateObject var itemListViewModel = ItemListViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
               
         ContentView()
           }
            // Use environment varialble to acess managed object context enviroment
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //use environment object to provide different views model variable
            .environmentObject(viewModel)
            .environmentObject(itemListViewModel)
            
                            
        }
    }
}
