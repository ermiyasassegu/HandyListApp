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
            
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(viewModel)
            .environmentObject(itemListViewModel)
            
                            
        }
    }
}
