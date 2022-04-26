//
//  ItemModel.swift
//  HandyListApp
//
//  Created by iosdev on 18.4.2022.
//

import Foundation

//enum Category : String {
//    case milk_cheese = "Milk & Cheese"
//    case baby = "Baby"
//    case snacks_sweets = "Snacks & Sweets"
//    case bakery = "bakery"
//    case beauty = "beaty&personal hygiene"
//    case beverages = "beverages"
//    case dairy = "dairy & eggs"
//    case fruits = "fruits & vegetables"
//}
struct ItemModel: Identifiable {
    let id: String
    let title: String
 //   let category: Category.RawValue
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

