//
//  String+Extensions.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 8.05.2021.
//

import Foundation
import CryptoSwift


private var aesKey: String? {
    return UserDefaults.standard.string(forKey: "aesKey")
}

private var aesIV: String? {
    return UserDefaults.standard.string(forKey: "aesIV")
}

extension String {
    func aesDecrypt() -> String {
        guard let aesKey = aesKey, let aesIV = aesIV else { return ""}
        let key = [UInt8](base64: aesKey)
        let iv = [UInt8](base64: aesIV)
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        
        let cipherdata = Data(base64Encoded: self)
        let ciphertext = try? aes?.decrypt(cipherdata!.bytes)
        guard let token = String(bytes:ciphertext!, encoding:String.Encoding.utf8) else {return ""}
        
        return token
    }
}
