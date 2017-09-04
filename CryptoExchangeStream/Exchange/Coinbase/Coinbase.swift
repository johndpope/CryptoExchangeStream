//
//  Coinbase.swift
//  CryptoExchange
//
//  Created by Joseph Blau on 9/3/17.
//  Copyright © 2017 Cryptostream. All rights reserved.
//

import Foundation
import Starscream
import RxSwift
import RxCocoa

public class Coinbase: WebSocketDelegate {
    public var connectionStatus = ConnectionStatus.disconnected
    public let tickerSubject = PublishSubject<Ticker>()
    
    private let jsonDecoder = JSONDecoder()
    private let socket = WebSocket(url: Exchange.coinbase.feed)
    
    init() {
        socket.delegate = self
        socket.connect()
    }
    
    public func subscribe(tokens: [Token]) {
        let message = """
        {
            "type": "subscribe",
            "product_ids": \(tokens.coinbaseSymbols())
        }
        """
        socket.write(string: message)
    }
    
    // MARK: - WebSocketDelegate
    
    public func websocketDidConnect(socket: WebSocket) {
        connectionStatus = .connected
    }
    
    public func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        connectionStatus = .disconnected
    }
    
    public func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        connectionStatus = .subscribed
        guard let messageData = text.data(using: .utf8) else { return }

        if let match = try? jsonDecoder.decode(CoinbaseMatchModel.self, from: messageData),
            let token = token(from: match.product_id) {
            let ticker = Ticker(exchange: .coinbase, token: token, price: match.price)
            tickerSubject.onNext(ticker)
        }
    }
    
    public func websocketDidReceiveData(socket: WebSocket, data: Data) {
        connectionStatus = .subscribed
    }
    
    // MARK: - Private
    
    private func token(from product_id: String) -> Token? {
        switch product_id {
        case "BTC-USD": return .btcusd
        case "ETH-USD": return .ethusd
        case "LTC-USD": return .ltcusd
        default: return nil
        }
    }
}
