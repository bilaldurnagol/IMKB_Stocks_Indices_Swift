//
//  APICaller.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 6.05.2021.
//

import Foundation
import CryptoSwift

class APICaller {
    
    static let shared = APICaller()
    
    struct Constant {
        static let apiURL = "https://mobilechallenge.veripark.com/api/stocks/list"
    }
    
    private var aesKey: String? {
        return UserDefaults.standard.string(forKey: "aesKey")
    }
    
    private var aesIV: String? {
        return UserDefaults.standard.string(forKey: "aesIV")
    }
    
    private var authorization: String? {
        return UserDefaults.standard.string(forKey: "authorization")
    }
    
    func fetchStocks(completion: @escaping (Result<StocksResponse, Error>) ->()) {
        
        guard let url = URL(string: Constant.apiURL) else {return}
        
        let body = [
            "period": aesCrypto()
        ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: body, options: .init())
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("api/handshake/start", forHTTPHeaderField: "POST")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(authorization, forHTTPHeaderField: "X-VP-Authorization")
        request.httpBody = bodyData
        
        URLSession.shared.dataTask(with: request, completionHandler: {data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(StocksResponse.self, from: data)
                
                completion(.success(result))
            }catch
            {
                completion(.failure(error))
            }
        }).resume()
    }
    
    func aesCrypto() -> String? {
        
        let key = [UInt8](base64: aesKey ?? "")
        let iv = [UInt8](base64: aesIV ?? "")
        
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        let cipherText = try? aes?.encrypt(Array("all".utf8))
        let base64String = cipherText?.toBase64()
        return base64String
    }
    
    //    func aesCrypto(completion: @escaping ([UInt8]) ->()){
    //        AuthManager.shared.handshake(completion: {result in
    //            switch result {
    //            case .failure(let error): print(error.localizedDescription)
    //            case .success(let keys):
    //                let aesKey = keys.aesKey
    //                let key = [UInt8](base64: aesKey)
    //
    //                let aesIV = keys.aesIV
    //                let iv = [UInt8](base64: aesIV)
    //
    //                let aes = try? AES(key: key, blockMode: CBC(iv: iv))
    //                let cipherText = try? aes?.encrypt(Array("all".utf8))
    //                print(keys.authorization)
    //
    //                completion(cipherText!)
    //            }
    //        })
    //    }
}
