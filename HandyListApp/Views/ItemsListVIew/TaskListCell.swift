//
//  TaskListCell.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct TaskListCell: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var taskListVM:TaskListViewModel
    @ObservedObject var taskListItem:TaskList
    
    @State private var isEdit = false
    
    var body: some View {
        HStack{
            HStack{
                if taskListItem.isDone{
                    Text(taskListItem.title ?? "").foregroundColor(.gray)
                }else{
                    Text(taskListItem.title ?? "")
                }
                Spacer()
                if (taskListItem.date != nil){
                    Text(calcTimeSince(date: taskListItem.date!))
                                .foregroundColor(.gray)
                                .italic()
                  
                }
                
            }
            Spacer()
            Button(action: {
                taskListVM.isDone(task: taskListItem, context: viewContext)
            }, label: {
                Image(systemName: !taskListItem.isDone ? "circle": "checkmark.circle")
            })
                .tint(.blue)
        }
        .sheet(isPresented: $isEdit){
            AddListView(addView: $isEdit)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true){
            Button(action: {
                taskListVM.isFavorite(task: taskListItem, context: viewContext)
            }, label: {
                Label("Favorite",systemImage: taskListItem.isFavorite ? "heart.slash" : "heart")
            })
                .tint(.green)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false){
            Button(role: .destructive, action: {
                taskListVM.delete(task: taskListItem, context: viewContext)
            }, label: {
                Label("Delete",systemImage: "trash")
            })
            Button(action: {
                taskListVM.taskListTitle = taskListItem.title ?? ""
                taskListVM.taskListItem = taskListItem
                isEdit.toggle()
            }, label: {
                Label("Edit",systemImage: "pencil")
            })
                .tint(.yellow)
        }
    }
}
