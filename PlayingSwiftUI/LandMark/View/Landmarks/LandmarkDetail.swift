//
//  LandmarkDetail.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData

    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImageView(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    // 接下来，将 FavoriteButton 添加到详细信息视图，将按钮的 isSet 属性绑定到给定地标的 isFavorite 属性。
                    //. 把数据源的 字段. 改了.
                }
                
                
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer() // 若要指导布局使用设备的全宽度，请通过向包含两个文本视图的水平堆栈添加间隔符来分离公园和状态。
                    // 间隔符展开以使其包含的视图使用其父视图的所有空间，而不是仅由其内容定义其大小。
                    Text(landmark.state)
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
//            Spacer() // 最后，使用 pding ()修饰符方法为地标的名称和细节提供更多的空间。

        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
