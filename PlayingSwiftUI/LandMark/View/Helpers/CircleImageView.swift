//
//  CircleImageView.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/5.
//

import SwiftUI

@available(iOS 15.0, *)
struct CircleImageView: View {
    
    var image: Image // 在 CircleImage.swift 中，向 CircleImage 添加存储的图像属性。 这是使用 SwiftUI 构建视图时的常见模式。自定义视图通常会包装和封装特定视图的一系列修饰符。
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)

    }
}

@available(iOS 15.0, *)
struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("turtlerock"))
    }
}
