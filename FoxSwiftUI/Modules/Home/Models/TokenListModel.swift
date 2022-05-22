//
//  TokenModel.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/21.
//  


import Foundation


struct TokenListModel: Decodable {
    var tokens: [TokenModel]
}

struct TokenModel: Decodable, Identifiable {
    var id: String {
        return name
    }
    var icon: String
    var name: String
    var count: Double
    var dollar: Double
}
