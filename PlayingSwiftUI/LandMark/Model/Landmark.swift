//
//  Landmark.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//
// 定义一个 Landmark 结构，其中一些属性与 landmarkData.json 数据文件中一些键的名称相匹配。
//


import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable {
    
    // 添加 Codable 使得在结构和数据文件之间移动数据变得更加容易。在本节后面的部分中，您将依靠 Codable 协议的 Decodable 组件从文件中读取数据。
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    // 计算对于与 MapKit 框架交互非常有用的 location坐标属性。
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // 使用反映 JSON 数据结构中存储的嵌套坐标类型将坐标属性添加到结构中。
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
