//
//  AuthManager.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 6.05.2021.
//

import Foundation
import CryptoSwift


final class AuthManager {
    static let shared = AuthManager()
    
    struct Contants {
        static let deviceId = "01234567-89ABCDEF-01234567-89ABCDEF"
        static let systemVersion = "12.2"
        static let platformName = "iOS"
        static let deviceModel = "iPhone XS Max"
        static let manifacturer = "Apple"
        static let handshakeURL = "https://mobilechallenge.veripark.com/api/handshake/start"
    }
    
    enum ApiError: Error {
        case failedToGetData
    }
     
    func handshake(completion: @escaping (Bool) ->()) {
        guard let url = URL(string: Contants.handshakeURL) else { return }
        
        let body = [
            "deviceId":Contants.deviceId,
            "systemVersion":Contants.systemVersion,
            "platformName":Contants.platformName,
            "deviceModel":Contants.deviceModel,
            "manifacturer":Contants.manifacturer
        ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: body, options: .init())
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("api/handshake/start", forHTTPHeaderField: "POST")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyData
        
        URLSession.shared.dataTask(with: request, completionHandler: {[weak self]data, _, error in
            guard let data = data,
                  error == nil
            else
            {
                completion(false)
                return
            }
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                self?.fetchKeys(result: result)
                
                completion(true)
            }catch {
                completion(false)
            }
        }).resume()
    }
    
    private func fetchKeys(result: AuthResponse) {
        UserDefaults.standard.setValue(result.authorization, forKey: "authorization")
        UserDefaults.standard.setValue(result.aesKey, forKey: "aesKey")
        UserDefaults.standard.setValue(result.aesIV, forKey: "aesIV")
    }
}
