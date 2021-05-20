//
//  ApiService.swift
//  Marvel Comics
//
//  Created by user192816 on 5/13/21.
//

import UIKit
import Alamofire
import CryptoKit

class ApiService {
   
    
    private let privateKey = "1be72de4faa6afbd68558025cd7b1c8a3ed9ac91"
    private let publicKey = "2a039887bd1b3d7a8fb4cfd16cfe7c71"
    private let ts = String(Date().timeIntervalSince1970)
    //var characters: ReturnApi!
    
    func marvelApiCall(completion: @escaping (ReturnApi, Error) -> ()) {
        //let parms = ["ts": ts, "hash": self.convertToMD5(), "apiKey": publicKey, "limit": "20"]

        let baseUrl = URL(string: "http://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(convertToMD5())")!
        AF.request(baseUrl).responseJSON {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let chars = try JSONDecoder().decode(ReturnApi.self, from: data)
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    private func convertToMD5() -> String {
        let apiData = (ts + privateKey + publicKey).data(using: .utf8)
        let apiHash = Insecure.MD5.hash(data: apiData!)
        return apiHash.map { String(format: "%02hhx", $0) }.joined()
    }
    
}
