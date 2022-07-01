//
//  LandmarkDetail.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImageView(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                
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
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
