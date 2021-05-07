//
//  AesCryptoManager.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 8.05.2021.
//

import CryptoSwift

class AesCryptoManager {
    
    static let shared = AesCryptoManager()
    
    private var aesKey: String? {
        return UserDefaults.standard.string(forKey: "aesKey")
    }
    
    private var aesIV: String? {
        return UserDefaults.standard.string(forKey: "aesIV")
    }
    
    func aesDecrypt(symbol: String) -> String {
        guard let aesKey = aesKey, let aesIV = aesIV else { return ""}
        let key = [UInt8](base64: aesKey)
        let iv = [UInt8](base64: aesIV)
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        
        let cipherdata = Data(base64Encoded: symbol)
        let ciphertext = try? aes?.decrypt(cipherdata!.bytes)
        guard let token = String(bytes:ciphertext!, encoding:String.Encoding.utf8) else {return ""}
        
        return token
    }
    
    func aesEncryption(with period: String) -> String? {
        
        let key = [UInt8](base64: aesKey ?? "")
        let iv = [UInt8](base64: aesIV ?? "")
        
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        let cipherText = try? aes?.encrypt(Array(period.utf8))
        let base64String = cipherText?.toBase64()
        return base64String
    }
    
}


