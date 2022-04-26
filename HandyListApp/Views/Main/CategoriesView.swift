//
//  CategoriesView.swift
//  HandyListApp
//
//  Created by iosdev on 10.4.2022.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView{
//            List {
//                ForEach(Category.allCases) {
//                    ScrollView{
//
//                    }
//                }
//            }
            Text ("Categories")
                .navigationTitle("Categories")
        }
    }
    
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
