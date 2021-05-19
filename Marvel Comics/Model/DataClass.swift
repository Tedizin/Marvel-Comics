//
//  DataClass.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 18/05/21.
//

import Foundation

struct DataClass: Decodable {
    let offset, limit, total, count: Int
    let results: [Characters]
    
}

//struct DataClass<T: Decodable>: Decodable {
//    let items: [T]
//
//    enum CodingKeys: String, CodingKey {
//        case items = "results"
//    }
//}
