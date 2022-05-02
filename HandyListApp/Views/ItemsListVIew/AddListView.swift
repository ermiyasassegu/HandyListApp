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
                            .frame(height: 55)
                            .background(Color(.white))
                            .cornerRadius(10)
                        Button(action: {
                            taskListVM.createTask(context: viewContext)
                            addView.toggle()
                        }, label: {
                            if taskListVM.taskListItem == nil {
                                Text("Add Item")
                                    .foregroundColor(.white)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                    .padding()
                            }
                            else{
                                Text("Edit Item")
                                    .foregroundColor(.white)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                    .padding()
                            }
                        })
                            
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.roundedRectangle)
                    }
                }
                .navigationTitle(taskListVM.taskListItem == nil ? "Add an Item 🥗" : "Edit an Item 🍝")
            }
        }
    }
