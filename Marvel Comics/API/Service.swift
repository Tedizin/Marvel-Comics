//
//  Services.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 13/05/21.
//

import UIKit
import Alamofire
import CryptoKit

class Service {
    
    public static let get = HTTPMethod(rawValue: "GET")

    let baseURL = "http://gateway.marvel.com/v1/public/comics"
    let publicKey = "53d86db4b4f54265554d105320c3d7e7"
    let privateKey = "beb6b6c6e2b6c26563514092219d56e717655602"
    let ts = String(Date().timeIntervalSince1970)

    public func requestURL() {
        
        let parameters = ["ts": ts,
                          "hash": self.getMD5(),
                          "apikey": publicKey]
        
        let request = AF.request(baseURL, parameters: parameters)
        request.responseJSON { (data) in
            print(data)
        }
        
    }
    
    private func getMD5() -> String {
        let apiData = ts + privateKey + publicKey
        guard let data = apiData.data(using: .utf8) else { return String() }
        let apiHash = Insecure.MD5.hash(data: data)
        return apiHash.map { String(format: "%02hhx", $0) }.joined()
    }
    
}

