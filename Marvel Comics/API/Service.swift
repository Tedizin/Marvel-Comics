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
    
    let baseURL = "http://gateway.marvel.com"
    let publicKey = "53d86db4b4f54265554d105320c3d7e7"
    let privateKey = "beb6b6c6e2b6c26563514092219d56e717655602"
    let ts = String(Date().timeIntervalSince1970)
    
    public func requestAPI(name: String) {
        
        
    }
    
    // MARK: - Search Request
    
    static let shared = Service()
    
    func requestCharacter(text: String, completion: @escaping (RequestAPI?) -> ()){
        
        let path = "/v1/public/characters"
        
        guard let url = URL(string: "\(baseURL)\(path)?ts=\(ts)&apikey=\(publicKey)&hash=\(getMD5())&nameStartsWith=\(text)") else {return}
        
        let parameters = ["ts": ts,
                          "hash": self.getMD5(),
                          "apikey": publicKey]
        
//        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: ReturnAPI.self) { (result) in
//            guard let response = result.value, result.error == nil else {
//                completion(nil)
//                return
//            }
//            completion(response)
//
//        }
            
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if err != nil {
                completion(nil)
                return
            }
            
            do {
                guard let data = data else {return}
                let characters = try JSONDecoder().decode(RequestAPI.self, from: data)
                completion(characters)
                
            } catch let err {
                completion(nil)
                return
            }
        }
        .resume()
    }
    
    func getMD5() -> String {
        let apiData = ts + privateKey + publicKey
        guard let data = apiData.data(using: .utf8) else { return String() }
        let apiHash = Insecure.MD5.hash(data: data)
        return apiHash.map { String(format: "%02hhx", $0) }.joined()
        
    }
    
}
