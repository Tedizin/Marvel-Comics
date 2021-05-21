//
//  RequestNetwork.swift
//  Marvel Comics
//
//  Created by Henrique Silva on 20/05/21.
//

import Foundation

//protocol RequestsGateway {
//    func loadAll<T: Decodable>(ofType: RequestCharacter, onComplete: @escaping (Result<T>) -> Void)
//}
//
//struct RequestsNetworkGateway: RequestsGateway {
//
//    let ts = 1
//    let publicKey = "cd474e2e09099fd47b15c4f50c28e30d"
//    let privateKey = "f8ba8e7d55cb57727b02bcb70174555c24fe24c4"
//
//    var hash: String {
//        let combined = "\(ts)\(privateKey)\(publicKey)"
//        let md5Data = MD5(string: combined)
//        let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
//
//        return md5Hex
//    }
//
//    func MD5(string: String) -> Data {
//        let messageData = string.data(using:.utf8)!
//        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
//
//        _ = digestData.withUnsafeMutableBytes {digestBytes in
//            messageData.withUnsafeBytes {messageBytes in
//                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
//            }
//        }
//
//        return digestData
//    }
//
//    func loadAll<T: Decodable>(ofType: Request, onComplete: @escaping (Result<T>) -> Void) {
//        switch ofType {
//        case .characters(let limit, let offset):
//            guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=name&limit=" +
//                "\(limit)&offset=\(offset)&apikey=\(publicKey)&hash=\(hash)&ts=\(ts)") else { return }
//
//            RequestAdapter.request(url, onComplete)
//
//        case .character(let id):
//            guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters/\(id)?apikey=" +
//                "\(publicKey)&hash=\(hash)&ts=\(ts)") else { return }
//
//            RequestAdapter.request(url, onComplete)
//
//        }
//    }
//}
