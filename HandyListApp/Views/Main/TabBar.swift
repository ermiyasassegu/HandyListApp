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
            ItemsListView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.crop.circle")
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
