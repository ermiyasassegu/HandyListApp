//
//  ItemListViewModel.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import Foundation
import Combine
import CoreData

class ItemListViewModel:ObservableObject{
    //The item on our list
    @Published var itemListTitle = ""
    @Published var itemListItem:TaskList!
    
     // function to add new task
    func createItem(context:NSManagedObjectContext){
        if itemListItem == nil {
            let item = TaskList(context: context)
            item.id = UUID()
            item.title = itemListTitle
            item.isDone = false
            item.isFavorite = false
            item.date = Date()
        }
        else{
            itemListItem.title = itemListTitle
        }
        
        // comes from the function save to save the data
        save(context: context)
        // blank after saving the data
        itemListTitle = ""
    }
    
    // edit an item
    func editList(item:TaskList){
        itemListItem = item
    }
    // simple uitlity to delete an item
    func delete(item:TaskList, context:NSManagedObjectContext){
        context.delete(item)
        save(context: context)
    }
     // save an item to the favorite
    func isFavorite(item:TaskList, context:NSManagedObjectContext){
        item.isFavorite.toggle()
        save(context: context)
    }
    
    // mark an item after complete the purchase
    func isDone(item:TaskList, context:NSManagedObjectContext){
        item.isDone.toggle()
        save(context: context)
    }
    
    // to save the data inside entity
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
    
}

