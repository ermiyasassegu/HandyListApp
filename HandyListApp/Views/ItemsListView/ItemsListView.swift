//
//  ItemsListView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct ItemsListView: View {
        @Environment(\.managedObjectContext) private var viewContext
    
        @EnvironmentObject var taskListVM:TaskListViewModel
        // fetching object from core data
        @FetchRequest(entity: TaskList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) var fetchedTaskList:FetchedResults<TaskList>
        
        @State private var addView = false
        
        var body: some View {
            NavigationView{
                List{
                    Section("Favorite"){
                        ForEach(fetchedTaskList.filter{$0.isFavorite == true}){item in
                            TaskListCell(taskListItem: item)
                        }
                    }
                    Section("Items"){
                        ForEach(fetchedTaskList.filter{$0.isFavorite == false}){item in
                            TaskListCell(taskListItem: item)
                        }
                    }
                    
                }
                .sheet(isPresented: $addView){
                    AddListView(addView: $addView)
                }
                .toolbar{
                    Button(action: {
                        taskListVM.taskListTitle = ""
                        taskListVM.taskListItem = nil
                        addView.toggle()
                    }, label: {
                        Label("Add Item",systemImage: "plus")
                    })
                }
                .navigationTitle("Grocery List")
            }
        }
    }
struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ItemsListView()
          
                           
    }
}
