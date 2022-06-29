//
//  MapView.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/6.
//

import SwiftUI
import MapKit

struct MapView: View {
    // 创建一个保存地图区域信息的私有状态变量。
    // 您可以使用 @State 属性为应用程序中的数据建立一个真相来源，您可以从多个视图修改这些数据。SwiftUI 管理基础存储并自动更新依赖于值的视图。
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
