//
//  PayMethodUtil.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/22.
//  


import Foundation
import SwiftUI


struct PayMethodUtil {
    static var paymethods: [PayMethodModel] = [
        PayMethodModel(payMethod: "Apple Pay",
                       subtitle: "5% free (limited time)",
                       description: "1 - 2 minutes \n Max $450 weekly Require debit card",
                       fixAreaDes: "U.S. only",
                       themeColor: .green),
        PayMethodModel(payMethod: "Bank transfer or debit card",
                       subtitle: "requires registratoin",
                       description: "Options and fees vary by location",
                       fixAreaDes: "33 countries",
                       themeColor: .blue)
    ]
    
}


struct PayMethodModel: Identifiable {
    var id: String {
        return payMethod
    }
    var payMethod: String
    var subtitle: String
    var description: String
    var fixAreaDes: String
    var themeColor: Color
    
}
