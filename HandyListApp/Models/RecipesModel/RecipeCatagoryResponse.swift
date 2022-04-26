//
//  RecipeCatagoryResponse.swift
//  HandyListApp
//
//  Created by iosdev on 22.4.2022.
//

import Foundation


struct RecipeCategoryResponse: Decodable {
    let categories: [RecipeCategory]
}

struct RecipeCategory: Decodable {
    let imageUrl: String
    let title: String
}
