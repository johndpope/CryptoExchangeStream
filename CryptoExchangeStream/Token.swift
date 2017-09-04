//
//  Token.swift
//  CryptoExchangeStream
//
//  Created by Joseph Blau on 9/3/17.
//  Copyright © 2017 Joseph Blau. All rights reserved.
//

import Foundation

public struct Token: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let btcusd = Token(rawValue: 1 << 0)
    public static let ethusd = Token(rawValue: 1 << 1)
    public static let ltcusd = Token(rawValue: 1 << 2)
}

extension Token: CustomStringConvertible {    
    public var description: String {
        switch self {
        case .btcusd: return "Bitcoin"
        case .ethusd: return "Ethereum"
        case .ltcusd: return "Litecoin"
        default: return "UNKNOWN"
        }
    }
}
