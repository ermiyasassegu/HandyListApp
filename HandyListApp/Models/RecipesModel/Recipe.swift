//
//  Recipe.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import Foundation

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    let id: String
    let imageUrl: String
    let title: String
}

