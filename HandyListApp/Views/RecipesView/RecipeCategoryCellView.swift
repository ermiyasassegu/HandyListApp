//
//  RecipeCategoryCellView.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import SwiftUI

// Display the individual category

struct RecipeCategoryCellView: View {
    
    let recipeCategory: RecipeCategoryViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            // image fetch from imageUrl
            AsyncImage(url: recipeCategory.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            } placeholder: {
                Image("recipes")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                  
            }
            Spacer()
            Text(recipeCategory.title)
        }
    }
}
