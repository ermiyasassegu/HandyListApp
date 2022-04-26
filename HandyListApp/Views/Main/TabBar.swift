//
//  TabBar.swift
//  HandyListApp
//
//  Created by iosdev on 10.4.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            CategoriesView()
                .tabItem{
                    Label("categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            ItemsListView()
                .tabItem{
                    Label("Add", systemImage: "plus")
                }
            
            RecipeCategoryListScreen ()
                .tabItem{
                    Label("Recipe", systemImage: "list.bullet")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        
    }
}
