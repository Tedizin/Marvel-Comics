//
//  Characters.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 13/05/21.
//

import UIKit

struct ReturnAPI: Codable {
    let code : Int
    let data: DataClass
    let etag: String
}

struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

struct Result: Codable {
   let id: Int
   let name: String
   let resourceURI: String
   let description: String
   let thumbnail: Thumbnail
   
   enum CodingKeys: String, CodingKey{
       case id
       case name
       case resourceURI
       case thumbnail
       case description
   }
}

struct Characters: Decodable {
    
    var id: Int!
    var name: String!
    var description: String!
    var thumbnail: Thumbnail
    var url: [CharacterURL]
    
//    init(id: Int, name: String, description: String) {
//        self.id = id
//        self.name = name
//        self.description = description
//    }
    
}

struct Thumbnail: Codable {
    
    var path: String
    var ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
}

struct CharacterURL: Codable {
    var type: String
    var url: String
}
