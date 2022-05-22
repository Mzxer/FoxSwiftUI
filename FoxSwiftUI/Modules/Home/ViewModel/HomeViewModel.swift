//
//  HomeViewModel.swift
//  SwiftDemo
//
//  Created by zengsenyuan on 2022/5/18.
//  

import SwiftUI


@MainActor final class HomeViewModel: ObservableObject {
    
    @Published var account: AccountModel?
    @Published var tokens: TokenListModel = TokenListModel(tokens: [])

    func requestAccountInfo() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            do {
                let _account: AccountModel = FileDataManaer.loadBundledJSON(file: "account")
                DispatchQueue.main.async {
                    self.account = _account
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func requestTokensList() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
            do {
                let _tokens: TokenListModel = FileDataManaer.loadBundledJSON(file: "tokenList")
                DispatchQueue.main.async {
                    self.tokens = _tokens
                }
            } catch let error {
                print(error)
            }
        }
    }
}

