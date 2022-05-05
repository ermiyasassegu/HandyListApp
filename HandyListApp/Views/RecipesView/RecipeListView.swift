//
//  RecipeListView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct RecipeListView: View {
    
    let recipes: [RecipeViewModel]
    
    var body: some View {
        // list the detail Recipes and from there navigate to the detail description of the individual recipe
        List(recipes, id: \.id) { recipe in
            NavigationLink(destination: RecipeDetailScreen(recipeId: recipe.id).navigationTitle(recipe.title)) {
                RecipeCellView(recipe: recipe)
            }
        }
    }
}


