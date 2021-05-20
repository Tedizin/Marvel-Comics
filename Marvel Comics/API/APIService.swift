//
//  APIService.swift
//  Marvel Comics
//
//  Created by Ted Motta on 19/05/21.
//

import UIKit
import Alamofire
import CryptoKit

class Credentials {
    
    func searchCharacters() {
        let ts = String(Date().timeIntervalSince1970)
        let hash = md5(data: "\(ts)\(privateKey)\(publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apiKey=\(publicKey)&hash=\(hash)"
        let parameters = ["ts": ts, "hash" : hash,  "publicKey" : publicKey]
        let request = AF.request(url, parameters: parameters)
        // 2
        request.responseJSON { (data) in
            print(data)
        }
    }
}
