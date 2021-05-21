//
//  Characters.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 13/05/21.
//

import UIKit

struct RequestAPI: Codable {
    let copyright, attributionText: String
    let code: Int
    let attributionHTML: String
    let data: DataClass
    let etag: String
    
}

struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
    
}

struct Result: Codable {
    let id: Int
    let modified, name, description, resourceURI: String
    let thumbnail: Thumbnail
    
    enum CodingKeys: String, CodingKey{
        case id
        case modified, name, description, resourceURI
        case thumbnail
        
    }
}

struct Thumbnail: Codable {
    let path: String
    let ext = "extension"
    
    enum CodingKeys: String, CodingKey{
        case ext, path
        
    }
    
}
