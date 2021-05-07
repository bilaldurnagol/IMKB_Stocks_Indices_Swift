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
        static let stocksURL = "https://mobilechallenge.veripark.com/api/stocks/list"
        static let detailsURL = "https://mobilechallenge.veripark.com/api/stocks/detail"
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
    
    func fetchStocks(period: String, completion: @escaping (Result<StocksResponse, Error>) ->()) {
        
        guard let url = URL(string: Constant.stocksURL) else {return}
        
        let body = [
            "period": aesCrypto(with: period)
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
    
    func getDetailsStock(with id: String, completion: @escaping (Result<StockDetailsResponse, Error>) ->()) {
        
        guard let url = URL(string: Constant.detailsURL) else {return}
        
        let body = [
            "id": aesCrypto(with: id)
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
                let result = try JSONDecoder().decode(StockDetailsResponse.self, from: data)
                completion(.success(result))
            }catch
            {
                completion(.failure(error))
            }
        }).resume()
    }
    
    func aesCrypto(with period: String) -> String? {
        
        let key = [UInt8](base64: aesKey ?? "")
        let iv = [UInt8](base64: aesIV ?? "")
        
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        let cipherText = try? aes?.encrypt(Array(period.utf8))
        let base64String = cipherText?.toBase64()
        return base64String
    }

}
