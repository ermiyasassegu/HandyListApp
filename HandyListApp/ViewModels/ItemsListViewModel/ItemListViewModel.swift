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
    @Published var itemListTitle = ""
    @Published var itemListItem:TaskList!
    
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
        
        save(context: context)
        itemListTitle = ""
    }
    
    func editList(item:TaskList){
        itemListItem = item
    }
    
    func delete(item:TaskList, context:NSManagedObjectContext){
        context.delete(item)
        save(context: context)
    }
    
    func isFavorite(item:TaskList, context:NSManagedObjectContext){
        item.isFavorite.toggle()
        save(context: context)
    }
    
    func isDone(item:TaskList, context:NSManagedObjectContext){
        item.isDone.toggle()
        save(context: context)
    }
    
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
    
}

