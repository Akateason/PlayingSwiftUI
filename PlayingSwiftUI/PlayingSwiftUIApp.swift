//
//  PlayingSwiftUIApp.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/3.
//

import SwiftUI

@main
struct PlayingSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView() // 1. 实现最简单的一个view
        }
    }
    
    // 使用 SwiftUI 应用程序生命周期的应用程序具有符合应用程序协议的结构。结构的 body 属性返回一个或多个场景，这些场景反过来又为显示提供内容。@ main 属性标识应用程序的入口点。
}
