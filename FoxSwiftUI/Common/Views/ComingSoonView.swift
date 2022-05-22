//
//  ComingSoonView.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/22.
//  


import SwiftUI

struct ComingSoonView: View {
    
    let imageWidth: CGFloat = UIScreen.main.bounds.width - 100
    let imageHeight: CGFloat = (UIScreen.main.bounds.width - 100) * (3/4)
    
    var body: some View {
        VStack(spacing: 16) {
            Image("coming_soon")
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .scaledToFill()
            
            Text("This function is comming soon ...")
        }
    }
    
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
