//
//  FavoriteButton.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/7/1.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool // 添加一个 isSet 绑定，该绑定指示按钮的当前状态，并为预览提供一个常量值。
    
    var body: some View {
        
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true)) // 由于使用绑定，因此在此视图中所做的更改将传播回数据源。
    }
}
