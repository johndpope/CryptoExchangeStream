//
//  CoinbaseTokenify.swift
//  CryptoExchangeStream
//
//  Created by Joseph Blau on 9/4/17.
//  Copyright © 2017 Joseph Blau. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element == Token  {
    public func coinbaseSymbols() -> [String] {
        return self.flatMap { (token) -> String? in
            switch token {
            case .btcusd: return "BTC-USD"
            case .ethusd: return "ETH-USD"
            case .ltcusd: return "LTC-USD"
            default: return nil
            }
        }
    }
}
