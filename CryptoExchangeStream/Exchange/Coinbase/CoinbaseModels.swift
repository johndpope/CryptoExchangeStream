//
//  CoinbaseModels.swift
//  CryptoExchangeStream
//
//  Created by Joseph Blau on 9/4/17.
//  Copyright © 2017 Joseph Blau. All rights reserved.
//

import Foundation

struct CoinbaseMatchModel: Codable {
    var type: String
    var trade_id: Int
    var sequence: Int
    var maker_order_id: String
    var taker_order_id: String
    var time: String
    var product_id: String
    var size: String
    var price: String
    var side: String
}
