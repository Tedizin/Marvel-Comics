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
    
    public let publicKey = "53d86db4b4f54265554d105320c3d7e7"
    public let privateKey = "beb6b6c6e2b6c26563514092219d56e717655602"
    public let ts = String(Date().timeIntervalSince1970)
    public var characters = [Result]()
    
    // MARK: - Search Request
    
    func requestCharacter(using closure: @escaping (() -> Void)){
        
        let baseURL = URL(string: "http://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(getMD5())")!
            
        AF.request(baseURL).responseJSON {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let chars = try JSONDecoder().decode(RequestAPI.self, from: data)
                self.characters = chars.data.results
                if(!self.characters.isEmpty){
                    closure()
                }
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    func getMD5() -> String {
        let apiData = (ts + privateKey + publicKey).data(using: .utf8)
        let apiHash = Insecure.MD5.hash(data: apiData!)
        return apiHash.map { String(format: "%02hhx", $0) }.joined()
    }
    
}
