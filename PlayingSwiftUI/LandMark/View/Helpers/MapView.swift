//
//  MapView.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/6.
//

import SwiftUI
import MapKit

struct MapView: View {

    // 在 MapView.ift 中，向 MapView 添加一个坐标属性，并更新预览提供程序以传递一个固定的坐标。
    var coordinate: CLLocationCoordinate2D
    
    // 创建一个保存地图区域信息的私有状态变量。
    // 您可以使用 @State 属性为应用程序中的数据建立一个真相来源，您可以从多个视图修改这些数据。SwiftUI 管理基础存储并自动更新依赖于值的视图。
    @State private var region = MKCoordinateRegion()

    
    
    var body: some View {
        
        // 向映射添加一个 onAppear 视图修饰符，该修饰符触发基于当前坐标的区域计算。
        Map(coordinateRegion: $region)
            .onAppear {
            setRegion(coordinate)
        }
    }
    
    // 添加一个基于坐标值更新区域的方法。
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
