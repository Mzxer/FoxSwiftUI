//
//  AccounMenuUtil.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/21.
//  


import Foundation

struct ActionMenuUtil {
    
    enum MenuType: String {
        case recieve
        case buy
        case sent
        case swap
    }
    
    struct MenuItem: Identifiable {
        var id: String {
            return type.rawValue
        }
        var type: MenuType
        var title: String
        var imageName: String
    }
    
    static let menuItems: [MenuItem] = [
        MenuItem(type: .recieve, title: "Recieve", imageName: "arrow.down.to.line"),
        MenuItem(type: .buy, title: "Buy", imageName: "creditcard"),
        MenuItem(type: .sent, title: "Sent", imageName: "arrow.up.right"),
        MenuItem(type: .swap, title: "Swap", imageName: "arrow.left.arrow.right")
    ]
}


