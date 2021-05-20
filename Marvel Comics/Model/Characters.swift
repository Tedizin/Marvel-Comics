//
//  Characters.swift
//  Marvel Comics
//
//  Created by Ted Motta on 20/05/21.
//

import Foundation

struct Characters : Codable {
    var id : Int
    var name : String
    var description: String
    var modified: Date
    var resourceURI : String
    var urls : [URL]
    var thumbnail : ResourceList
    var comics : ResourceList
    var stories : ResourceList
    var events : ResourceList
    var series : ResourceList
    var etag: String
}

struct ResourceList : Codable {
    var avaliable: Int
    var returned : Int
    var collectionURI : String
    var itens : [Itens]
}

struct Itens : Codable {
    var resourceURI : String
    var name : String
    var type : String
}
