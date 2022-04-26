//
//  ListView.swift
//  HandyListApp
//
//  Created by iosdev on 12.4.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
               ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Shopping List 🛍")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("+", destination:AddItemsView())
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           
            NavigationView{
                ListView()
            }
            .environmentObject(ListViewModel())
        }
    }
}

