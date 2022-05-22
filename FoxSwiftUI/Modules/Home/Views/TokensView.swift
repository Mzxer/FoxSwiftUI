//
//  TOKENsView.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/21.
//  


import SwiftUI

struct TOKENsView: View {
    
    var tokenList: TokenListModel
    
    enum JumpType {
        case importToken
    }
    
    @State private var jumpTag: JumpType?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(tokenList.tokens) { token in
                    TokenRow(model: token)
                        .onTapGesture {
                    
                    }
                }
                .padding(.top)
                footerTip
            }
        }
        .padding(.top, 35)
    }
    
    var footerTip: some View {
        VStack(spacing: 6) {
            Text("Don't see your token?")
                .font(.subheadline)
            NavigationLink(tag: JumpType.importToken, selection: $jumpTag) {
                ImportTokenView()
            } label: {
                Button {
                    jumpTag = .importToken
                } label: {
                    Text("Import Tokens")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.top)
    }
}

struct TokenRow: View {
    
    let model: TokenModel
    
    var body: some View {
        VStack {
            HStack {
                Image(model.icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .padding(.trailing, 4)
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(model.count) " + model.name)
                        .font(.subheadline)
                    Text("$\(model.dollar)")
                        .font(.caption)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal)
            Divider()
                .foregroundColor(.gray)
                .frame(height: 1)
        }
    }
}

