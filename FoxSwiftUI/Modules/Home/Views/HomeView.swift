//
//  HomeView.swift
//  SwiftDemo
//
//  Created by zengsenyuan on 2022/5/18.
//  


import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var actionTapType: ActionMenuUtil.MenuType?
    @State private var contentSelectedIndex: Int = 0
    @Namespace var animation
    
    var body: some View {
        if let account = viewModel.account {
            
            NavigationView {
                VStack {
                    naviationBar
                    Divider().background(Color.gray)
                    AccountContentView(account: account)
                        .padding(.bottom, 16)
                    actionMenu
                    content
                    Spacer()
                }
                .hiddenNavigationBarStyle()
            }
            .accentColor(.blue)
            .onAppear {
                self.viewModel.requestTokensList()
            }
        } else {
            Text("Loading...")
                .onAppear {
                    self.viewModel.requestAccountInfo()
                }
        }
    }
    
    //MARK: naviationBar
    var naviationBar: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title3)
            }
            .foregroundColor(Color.blue)
            Spacer()
            VStack(spacing: 4) {
                Text("Wallet")
                    .font(.title)
                HStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                    Text("Etherem Main Network")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.title3)
            }
            .foregroundColor(Color.blue)
        }.padding(.horizontal)
    }
    
    
    var actionMenu: some View {
        HStack(spacing: 8) {
            ForEach(ActionMenuUtil.menuItems) { item in
                NavigationLink(tag: item.type, selection: $actionTapType, destination: {
                    switch actionTapType {
                    case .recieve: RecieveView()
                    case .buy: BuyView()
                    case .sent: SentView()
                    case .swap: SwapView()
                    case .none:
                        ComingSoonView()
                    }
                }, label: {
                    Button {
                        actionTapType = item.type
                    } label: {
                        VStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Image(systemName: item.imageName)
                                        .foregroundColor(.white)
                                )
                            
                            Text(item.title)
                                .font(.subheadline)
                                .foregroundColor(Color.blue)
                        }
                        .frame(width: 60)
                    }
                })
            }
        }
    }
    
    var content: some View {
        
        TabView(selection: $contentSelectedIndex) {
            TOKENsView(tokenList: viewModel.tokens).tag(0)
            NFTsView().tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay(
            VStack(spacing: 1) {
                HStack(spacing: 0) {
                    ForEach(0 ..< ContentTapMenuUtil.menuItems.count) { i in
                        VStack {
                            Text(ContentTapMenuUtil.menuItems[i].title)
                                .foregroundColor(contentSelectedIndex == i ? .blue : .gray)
                                .frame(maxWidth: .infinity)
                            
                            if contentSelectedIndex == i {
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "tab", in: animation)
                            } else {
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(height: 2)
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                contentSelectedIndex = i
                            }
                        }
                    }
                }
            }.background(Color.white)
            , alignment: .top
                
        )
        .padding(.top)
    }
}

struct AccountContentView: View {
    var account: AccountModel
    var body: some View {
        VStack(alignment: .center) {
            Image(account.avatar)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .background(Circle().stroke(Color.blue, lineWidth: 2))
                .padding(.vertical, 4)
            
            Text(account.name)
                .font(.title)
                .padding(.bottom, 4)
            Text("$ \(account.dollar)")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.bottom, 4)
            Text(account.secretKey)
                .font(.caption)
                .truncationMode(.middle)
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
                .frame(width: 100, height: 20, alignment: .center)
                .background(Capsule().fill(Color.yellow))
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        demoHomeView
    }
}

let demoHomeView = HomeView()
