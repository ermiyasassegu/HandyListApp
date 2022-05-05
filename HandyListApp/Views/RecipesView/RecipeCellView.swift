//
//  RecipeCellView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

struct RecipeCellView: View {
    
    let recipe: RecipeViewModel
    
    var body: some View {
        HStack {
            // fetch the image from Url
            AsyncImage(url: recipe.imageURL) { image in
                image.resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            } placeholder: {
                //ProgressView()
                Image("recipes")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20, alignment: .trailing)
                    .foregroundColor(.white.opacity(0.7))
                    
            }
            Spacer()
            Text(recipe.title)
        }
    }
}
