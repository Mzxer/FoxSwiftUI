//
//  ContentTapMenuUtil.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/22.
//  


import Foundation

struct ContentTapMenuUtil {
    
    struct MenuItem: Identifiable {
        var id: String {
            return title
        }
        var title: String
    }
    
    static let menuItems: [MenuItem] = [
        MenuItem(title: "TOKENS"),
        MenuItem(title: "NFTs")
    ]
}
