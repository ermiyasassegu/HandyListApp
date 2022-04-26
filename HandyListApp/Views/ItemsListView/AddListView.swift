//
//  AddListView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI


    struct AddListView: View {
        @Environment(\.managedObjectContext) var viewContext
        @EnvironmentObject var taskListVM:TaskListViewModel
        @Binding var addView:Bool
        
        var body: some View {
            NavigationView{
                Form{
                    VStack{
                        TextField("Enter Name", text: $taskListVM.taskListTitle)
                        Button(action: {
                            taskListVM.createTask(context: viewContext)
                            addView.toggle()
                        }, label: {
                            if taskListVM.taskListItem == nil {
                                Text("Add Item")
                                    .frame(minWidth: 0,maxWidth: .infinity)
                                    .background(.blue)
                                    .padding()
                            }
                            else{
                                Text("Edit Item")
                                    .frame(minWidth: 0,maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .background(.blue)
                                    .padding()
                            }
                        })
                            .tint(.yellow)
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.roundedRectangle)
                    }
                }
                .navigationTitle(taskListVM.taskListItem == nil ? "Add Item" : "Edit")
            }
        }
    }
