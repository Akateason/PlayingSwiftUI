//
//  ContentView.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/3.
// 默认情况下，SwiftUI 视图文件声明两个结构。第一个结构符合 View 协议，并描述视图的内容和布局。第二个结构声明了该视图的预览。

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
