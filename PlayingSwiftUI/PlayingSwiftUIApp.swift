//
//  PlayingSwiftUIApp.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/3.
//

import SwiftUI

@main
struct PlayingSwiftUIApp: App {
    
    @StateObject private var modelData = ModelData()
    // 更新 PlayingSwiftUIApp 以创建一个模型实例，并使用 Environment Object (_:)修饰符将其提供给 ContentView。
    // 使用 @StateObject 属性在应用程序的生命周期内只初始化给定属性的模型对象一次。当您在应用程序实例中使用该属性时(如下所示) ，以及在视图中使用该属性时，都是如此。
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
    
    // 使用 SwiftUI 应用程序生命周期的应用程序具有符合应用程序协议的结构。结构的 body 属性返回一个或多个场景，这些场景反过来又为显示提供内容。@ main 属性标识应用程序的入口点。
}
