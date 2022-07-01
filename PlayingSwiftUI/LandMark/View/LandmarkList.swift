//
//  LandmarkList.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationView {

            // 动态赋值
            // List(landmarks, id: \.id) { landmarkItem in
            // 这里. id参数为什么可以删除, 参考 Landmark 带有Identifiable协议, 切有id属性.
            
            List(landmarks) { landmarkItem in
//                // 通过从闭包返回 LandmarkRow 来完成动态生成的列表。 这将为地标数组中的每个元素创建一个 LandmarkRow。
//                LandmarkRow(landmark: landmarkItem)
                
                NavigationLink {
                    LandmarkDetail(landmark: landmarkItem)
                } label: {
                    LandmarkRow(landmark: landmarkItem)
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
