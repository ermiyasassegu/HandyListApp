//
//  RecipeListScreen.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

// display the recipe to the particular category
struct RecipeListScreen: View {
    
    let recipeCategory: RecipeCategoryViewModel
    @StateObject private var recipeListVM = RecipeListViewModel()
    
    var body: some View {
        // list for a particular category and async action while loading
        RecipeListView(recipes: recipeListVM.recipes)
            .task {
                await recipeListVM.populateRecipesByCategory(name: recipeCategory.title)
            }
    }
}

struct RecipeListScreen_Previews: PreviewProvider {
    static var previews: some View {
       
        let recipeCategoryVM = RecipeCategoryViewModel(RecipeCategory(imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1618257399/RecipesApi/Chicken.png", title: "Chicken"))
        
        RecipeListScreen(recipeCategory: recipeCategoryVM)
    }
}
