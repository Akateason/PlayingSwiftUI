//
//  ModelData.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/6/30.
//

import Foundation
import Combine

// 声明一个新的模型类型，该模型类型符合组合框架中的 Observer ableObject 协议。
// SwiftUI 订阅可观察对象，并在数据更改时更新任何需要刷新的视图。
// 可观察对象需要发布其数据的任何更改，以便其订阅者能够获取更改。
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


// 创建一个从 landmarkData.json 初始化的地标数组。
//var landmarks: [Landmark] = load("landmarkData.json")


// 创建一个 load (_:)方法，该方法从应用程序的包 中获取具有给定名称的 JSON 数据
// Load 方法依赖于返回类型与 Decodable 协议的一致性，该协议是 Codable 协议的一个组件

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


