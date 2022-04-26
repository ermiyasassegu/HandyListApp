//
//  RecipeDetailResponse.swift
//  HandyListApp
//
//  Created by iosdev on 25.4.2022.
//

import Foundation

struct RecipeDetailResponse: Decodable {
    let recipe: RecipeDetail
}

struct RecipeDetail: Decodable {
    let imageUrl: String
    let id: String
    let title: String
    let ingredients: [String]
}
