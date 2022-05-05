//
//  RecipeCategoryViewModel.swift
//  HandyListApp
//
//  Created by iosdev on 22.4.2022.
//

import Foundation

// in IOS 15 and above we can use @MainActor instead of dispatchQueue and it is a global actor that uses the main queue for excuting its work
@MainActor
class RecipeCategoryListViewModel: ObservableObject {
    
    @Published var recipeCategories: [RecipeCategoryViewModel] = []
    
    func populateCategories() async {
        
        do {
            // async function that calls the Url and parse the data return the decode recipe catagory that we created
            let recipeCategoryResponse = try await Webservice().get(url:
                Constants.Urls.recipeCategoriesURL) { data in
                return try? JSONDecoder().decode(RecipeCategoryResponse.self, from: data)
            }
            
            // map through the whole categories comes from the url and return the recipe categories
            //this should be display in the main queue and @MainActor will substitute the dispatchqueue
            self.recipeCategories = recipeCategoryResponse.categories.map(RecipeCategoryViewModel.init)
            
        } catch {
            print(error)
        }
        
    }
    
}

struct RecipeCategoryViewModel: Identifiable {
    
    let id = UUID()
    
    private let recipeCategory: RecipeCategory
    
    //initialize the private recipe category so nobody should be able to access it
    init(_ recipeCategory: RecipeCategory) {
        self.recipeCategory = recipeCategory
    }
    
    var title: String {
        recipeCategory.title
    }
    
    var imageUrl: URL? {
        URL(string: recipeCategory.imageUrl)
    }
    
}
