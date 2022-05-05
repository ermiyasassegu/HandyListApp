//
//  Recipe.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import Foundation

struct RecipeResponse: Decodable {
    // recipe model for each item
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    let id: String
    let imageUrl: String
    let title: String
}

