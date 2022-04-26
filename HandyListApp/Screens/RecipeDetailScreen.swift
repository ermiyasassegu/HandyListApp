//
//  RecipeDetailScreen.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct RecipeDetailScreen: View {
    
    let recipeId: String
    @StateObject private var recipeDetailVM = RecipeDetailViewModel()
    let bounds = UIScreen.main.bounds
    
    var body: some View {
        VStack(alignment: .leading) {
                 AsyncImage(url: recipeDetailVM.imageUrl) { image in
                     image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: bounds.width - 20)
                         .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                 } placeholder: {
                     //ProgressView()
                     Image("recipes")
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 150, height: 150, alignment: .center)
                         .foregroundColor(.white.opacity(0.7))
                         .frame(maxWidth: .infinity, maxHeight: 300)
                 }
                 .padding(.bottom, 20)
                 
                 ForEach(recipeDetailVM.ingredients, id: \.self) { ingredient in
                     Text(ingredient)
                 }
                 
                 Spacer()
             }
        .padding()
        .task {
            await recipeDetailVM.populateRecipeDetail(recipeId: recipeId)
        }
    }
}

struct RecipeDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailScreen(recipeId: "36498")
    }
}
