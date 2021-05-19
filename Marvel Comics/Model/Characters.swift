//
//  Characters.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 13/05/21.
//

import UIKit



struct Characters: Decodable {
    let id: Int
    let name: String
    let description: String
    let resourceURI: String
    let thumbnail: Thumbnail
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case resourceURI
        case thumbnail
        case description
        
    }
}

struct CharacterURL: Codable {
    var type: String
    var url: String
    
}
