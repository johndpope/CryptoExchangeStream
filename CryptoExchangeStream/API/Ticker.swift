//
//  Ticker.swift
//  CryptoExchangeStream
//
//  Created by Joseph Blau on 9/4/17.
//  Copyright © 2017 Joseph Blau. All rights reserved.
//

import Foundation

public struct Ticker {
    var exchange: Exchange
    var token: Token?
    var price: String
}
