//
//  Status.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 7.05.2021.
//

import Foundation


struct Status: Codable {
    let isSuccess: Bool
    let error: ErrorResponse
}

struct ErrorResponse: Codable {
    let code: Int
    let message: String?
}
