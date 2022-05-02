//
//  AddListView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI


    struct AddListView: View {
        @Environment(\.managedObjectContext) var viewContext
        @EnvironmentObject var itemListVM:ItemListViewModel
        @Binding var addView:Bool
        
        var body: some View {
            NavigationView{
                Form{
                    VStack{
                        TextField("Enter Name", text: $itemListVM.itemListTitle)
                            .frame(height: 55)
                            .background(Color(.white))
                            .cornerRadius(10)
                            .accessibility(identifier: "addItemTextField")
                        Button(action: {
                            itemListVM.createItem(context: viewContext)
                            addView.toggle()
                        }, label: {
                            if itemListVM.itemListItem == nil {
                                Text("Add Item")
                                    .accessibility(identifier: "addItemButton")
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
                .navigationTitle(itemListVM.itemListItem == nil ? "Add an Item" : "Edit an Item")
            }
        }
    }
