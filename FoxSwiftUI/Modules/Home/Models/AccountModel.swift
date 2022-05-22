//
//  AccountModel.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/21.
//  


import Foundation


struct AccountModel: Decodable {
    var name: String
    var avatar: String
    var secretKey: String
    var dollar: Double
}
