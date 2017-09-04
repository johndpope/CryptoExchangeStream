//
//  Exchange.swift
//  CryptoExchange
//
//  Created by Joseph Blau on 9/3/17.
//  Copyright © 2017 Cryptostream. All rights reserved.
//

import Foundation

public enum Exchange {
    case coinbase
}

protocol ExchangeWebsocketFeeding {
    var feed: URL { get }
}

extension Exchange: CustomStringConvertible, CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .coinbase: return "Coinbase"
        }
    }
    
    public var description: String {
        switch self {
        case .coinbase: return "Coinbase"
        }
    }
}

extension Exchange: ExchangeWebsocketFeeding {
    internal var feed: URL {
        switch self {
        case .coinbase: return URL(string: "wss://ws-feed.gdax.com")!
        }
    }
}
