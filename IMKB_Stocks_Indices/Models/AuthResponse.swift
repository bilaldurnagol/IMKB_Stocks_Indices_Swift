//
//  AuthResponse.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 6.05.2021.
//

import Foundation


struct AuthResponse: Codable {
    let aesKey: String
    let aesIV: String
    let authorization: String
    let lifeTime: String
    let status: Status
}
