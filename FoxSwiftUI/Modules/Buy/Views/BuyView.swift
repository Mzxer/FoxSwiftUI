//
//  BuyView.swift
//  SwiftDemo
//
//  Created by zengsenyuan on 2022/5/21.
//  


import SwiftUI

struct BuyView: View {
    var paymethods: [PayMethodModel] = PayMethodUtil.paymethods
    
    var body: some View {
        VStack() {
            Text("How do you want to make your purchase")
                .font(.title2)
                .bold()
                .frame(alignment: .center)
                .padding(20)
                .multilineTextAlignment(.center)
            Spacer()
            payMethodList
        }
    }
    
    var payMethodList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(paymethods) { item in
                    PayMethoRow(model: item)
                        .onTapGesture {
                            
                    }
                }.padding(.top)
                
                Button {
                    
                } label: {
                    Text("See More >>")
                        .foregroundColor(Color.blue)
                }.padding(.top)
                
            }
        }
    }
}

struct PayMethoRow: View {
    
    let model: PayMethodModel
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(model.payMethod)
                        .font(.title2)
                        .bold()
                    Text(model.subtitle)
                        .font(.callout)
                        .bold()
                        .foregroundColor(.gray)
                    Text(model.description)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                Spacer()
                    .frame(width: 20)
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    HStack(spacing: 4) {
                        Text(model.fixAreaDes)
                            .font(.callout)
                        Image(systemName: "exclamationmark.circle")
                            .font(.caption)
                    }
                }
            }.padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, model.themeColor]), startPoint: .leading, endPoint: .trailing
                    )
                )
        )
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(model.themeColor)
        )
        .padding(.horizontal, 20)
    }
}



struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        BuyView()
    }
}
