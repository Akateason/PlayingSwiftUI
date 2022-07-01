//
//  LandmarkList.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//

import SwiftUI

struct LandmarkList: View {
    // 模型数据属性自动获取它的值，只要已经对父级应用了 Environmental Object (_:)修饰符。
    @EnvironmentObject var modelData: ModelData
        
    // 使用 @State 属性包装器将值标记为 state，将属性声明为 private，并为其赋予默认值。
    @State private var showFavoritesOnly = false

    // 过滤. 是否收藏 or not
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        
        NavigationView {

            // 动态赋值
            // List(landmarks, id: \.id) { landmarkItem in
            // 这里. id参数为什么可以删除, 参考 Landmark 带有Identifiable协议, 切有id属性.
            //                // 通过从闭包返回 LandmarkRow 来完成动态生成的列表。 这将为地标数组中的每个元素创建一个 LandmarkRow。
            //                LandmarkRow(landmark: landmarkItem)
            // 也可以用 ForEach 代替block回调的方式. 也是遍历.
            
            
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                } // 开关. 绑定state,  $showFavoritesOnly
                
                ForEach(filteredLandmarks) { landmarkItem in
                    
                    NavigationLink {
                        LandmarkDetail(landmark: landmarkItem)
                    } label: {
                        LandmarkRow(landmark: landmarkItem)
                    }
                    
                }
            }
            .navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // 更新 LandmarkDetail 视图以在环境中使用 ModelData 对象。
        LandmarkList().environmentObject(ModelData())
    }
}
