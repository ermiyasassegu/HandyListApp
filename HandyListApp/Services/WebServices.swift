//
//  WebServices.swift
//  HandyListApp
//
//  Created by iosdev on 22.4.2022.
//

import Foundation

enum NetworkError: Error {
    
    case badRequest
    case decodingError
}

class Webservice {
    
    //get function to get any decodable from the Url and every function can  be decoded deferently so we parse the data and return what ever the type is
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // check the data exist otherwise throw some bad request error
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        // get the result otherwise throw some network error
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
        // if succeed return the result
        return result
    }
    
}
