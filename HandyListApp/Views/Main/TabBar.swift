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
                    Label((LocalizedStringKey("Home")), systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label((LocalizedStringKey("Profile")), systemImage: "person.crop.circle")
                }
            
            RecipeCategoryListScreen ()
                .tabItem{
                    Label((LocalizedStringKey("Recipe")), systemImage: "list.bullet")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        
    }
}
