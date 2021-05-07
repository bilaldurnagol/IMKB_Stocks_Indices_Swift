//
//  Double+Extensions.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 7.05.2021.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
