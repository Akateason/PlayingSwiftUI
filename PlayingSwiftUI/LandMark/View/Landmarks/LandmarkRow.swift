//
//  LandmarkRow.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//

import SwiftUI

struct LandmarkRow: View {
    
    // Add landmark as a stored property of LandmarkRow.
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50) // 图片
            
            Text(landmark.name) // 文字
            
            Spacer() // 后面撑满
            
            // 收藏
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        
        // 使用 previewLayout (_:)修饰符可以设置一个近似于列表中某一行的大小。
//        LandmarkRow(landmark: landmarks[0]).previewLayout(.fixed(width: 300, height: 70))
        
        
        // Group 是一个对视图内容进行分组的容器。
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
