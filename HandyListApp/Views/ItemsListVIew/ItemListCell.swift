//
//  ItemListCell.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct ItemListCell: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var itemListVM:ItemListViewModel
    @ObservedObject var itemListItem:TaskList
    
    @State private var isEdit = false
    
    var body: some View {
        HStack{
            HStack{
                if itemListItem.isDone{
                    Text(itemListItem.title ?? "").foregroundColor(.gray)
                }else{
                    Text(itemListItem.title ?? "")
                }
                Spacer()
                if (itemListItem.date != nil){
                    Text(calcTimeSince(date: itemListItem.date!))
                                .foregroundColor(.gray)
                                .italic()
                  
                }
                
            }
            Spacer()
            // the button to mark after the purchase completed
            Button(action: {
                itemListVM.isDone(item: itemListItem, context: viewContext)
            }, label: {
                Image(systemName: !itemListItem.isDone ? "circle": "checkmark.circle")
            })
                .tint(.blue)
        }
        // pop up the sheet to edit
        .sheet(isPresented: $isEdit){
            AddListView(addView: $isEdit)
        }
        
        // to swipe the item from the list to add to the favorite
        .swipeActions(edge: .leading, allowsFullSwipe: true){
            Button(action: {
                itemListVM.isFavorite(item: itemListItem, context: viewContext)
            }, label: {
                Label("Favorite",systemImage: itemListItem.isFavorite ? "heart.slash" : "heart")
            })
                .tint(.green)
        }
        
        // swipe the item to delete, edit in a new pop up sheet
        .swipeActions(edge: .trailing, allowsFullSwipe: false){
            Button(role: .destructive, action: {
                itemListVM.delete(item: itemListItem, context: viewContext)
            }, label: {
                Label("Delete",systemImage: "trash")
            })
            
            Button(action: {
                itemListVM.itemListTitle = itemListItem.title ?? ""
                itemListVM.itemListItem = itemListItem
                isEdit.toggle()
            }, label: {
                Label("Edit",systemImage: "pencil")
            })
                .tint(.yellow)
        }
    }
}
