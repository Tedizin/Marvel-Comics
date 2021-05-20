//
//  APIService.swift
//  Marvel Comics
//
//  Created by Ted Motta on 19/05/21.
//

import UIKit
import Alamofire
import CryptoKit

class ApiService {
    public static let get = HTTPMethod(rawValue: "GET")
    let baseURL: String = "http://gateway.marvel.com/v1/public/characters"
    let privateKey = "beb6b6c6e2b6c26563514092219d56e717655602"
    let publicKey = "53d86db4b4f54265554d105320c3d7e7"
    let ts = String(Date().timeIntervalSince1970)
    
    public func apiRequest() {
        
        let parameters = ["ts": ts, "hash" : self.getMD5(),  "publicKey" : publicKey]
        
        let request = AF.request(baseURL, parameters: parameters)
        // 2
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
