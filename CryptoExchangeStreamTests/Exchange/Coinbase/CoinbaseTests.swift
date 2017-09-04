//
//  CoinbaseTests.swift
//  CryptoExchangeTests
//
//  Created by Joseph Blau on 9/3/17.
//  Copyright © 2017 Cryptostream. All rights reserved.
//

import XCTest

@testable import CryptoExchangeStream

class CoinbaseTests: XCTestCase {
    
    func testConnection() {
        let coinbase = Coinbase()
        let expect = expectation(description: "websocketDidConnect")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if coinbase.connectionStatus == ConnectionStatus.connected {
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testSubscriiption() {
        let coinbase = Coinbase()
        let expect = expectation(description: "websocketDidConnect")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if coinbase.connectionStatus == ConnectionStatus.connected {
                coinbase.subscribe(tokens: [.btcusd, .ethusd, .ltcusd])
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            if coinbase.connectionStatus == ConnectionStatus.subscribed {
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}

