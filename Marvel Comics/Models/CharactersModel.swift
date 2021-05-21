//
//  CharactersModel.swift
//  Marvel Comics
//
//  Created by user192816 on 5/15/21.
//

import UIKit

/*struct characterModel: Decodable {
    var id: Int?
    var name: String?
    var description: String?
    //var thumbnail: UIImage?
    var comics: [String]?
    var stories: [String]?
    var events: [String]?
    var series: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case comics = "comics"
        case stories = "stories"
        case events = "events"
        case series = "series"
    }
}*/

 // MARK: - ReturnApi
 struct ReturnApi: Codable {
     let copyright, attributionText: String
     let code : Int
     let attributionHTML: String
     let data: DataClass
     let etag: String
 }

 // MARK: - DataClass
 struct DataClass: Codable {
     let offset, limit, total, count: Int
     let results: [Result]
 }

 // MARK: - Result
 struct Result: Codable {
    let id: Int
    let modified, name, resourceURI, description: String
    let thumbnail: Thumbnail
    
    enum CodingKeys: String, CodingKey{
        case id
        case modified, name, resourceURI, thumbnail, description
 }


// MARK: -Heros
struct Heros: Codable{

    }
}

struct Thumbnail: Codable {
    let path: String
    let xtension = "extension"
    enum CodingKeys: String, CodingKey{
        case xtension, path
    }
    
}
