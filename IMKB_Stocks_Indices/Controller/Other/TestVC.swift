//
//  TestVC.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit
import CryptoSwift

class TestVC: UIViewController {
    let symbol = "2CiJq7848elBewouw9GMkQ=="
    let aesKey = "oSU7KTuH6itLjbsmPcxSRDn/6/lHY8Yy2FEfmcdHBBY="
    let aesIV = "bHJNgmBtgtJKgBwemNXafw=="
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(aesCrypto(with: "all"))
        aesDecrypt()
//        print(base64ToByteArray(base64String: symbol))
    }
    func aesDecrypt() {
        
        let key = [UInt8](base64: aesKey)
        let iv = [UInt8](base64: aesIV)
        
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        
//        let uintArray = base64ToByteArray(base64String: symbol)!
//        print(uintArray)
        
        let cipherdata = Data(base64Encoded: symbol)
        let ciphertext = try? aes?.decrypt(cipherdata!.bytes)
        let token = String(bytes:ciphertext!, encoding:String.Encoding.utf8)
        print(token)
    }

    
    func aesCrypto(with period: String) -> String? {
        
        let key = [UInt8](base64: aesKey)
        let iv = [UInt8](base64: aesIV)
        
        let aes = try? AES(key: key, blockMode: CBC(iv: iv))
        let cipherText = try? aes?.encrypt(Array(period.utf8))
        print(cipherText)
        let base64String = cipherText?.toBase64()
        return base64String
    }
    
    func base64ToByteArray(base64String: String) -> [UInt8]? {
        if let nsdata = NSData(base64Encoded: base64String, options: []) {
            
            var bytes = [UInt8](repeating: 0, count: nsdata.length)
              nsdata.getBytes(&bytes)
              return bytes
          }
          return nil // Invalid input
    }

}

