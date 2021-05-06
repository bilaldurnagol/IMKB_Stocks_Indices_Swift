//
//  StocksResponse.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 7.05.2021.
//

import Foundation

struct StocksResponse: Codable {
    let stocks: [Stock]
    let status: Status
}

struct Stock: Codable {
    let id: Int
    let isDown: Bool
    let isUp: Bool
    let bid: Float
    let difference: Float
    let offer: Float
    let price: Float
    let volume: Float
    let symbol: String
}
