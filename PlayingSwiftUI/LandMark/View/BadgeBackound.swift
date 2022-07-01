//
//  BadgeBackound.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/7/1.
//

import SwiftUI

struct BadgeBackound: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            Path { path in

                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale

                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * 0.20
                    )
                )
                // Move (to:)方法在一个形状的边界内移动绘图光标，就好像一支虚构的钢笔或铅笔悬停在该区域上空，等待开始绘图。
                
                HexagonParameters.segments.forEach { segment in
                    
                    // 为形状数据的每个点绘制线条，以创建一个粗略的六角形形状
                    // addLine (to:)的连续调用从前一个点开始一行并继续到新的点。
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    // 加Bézier曲线
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }

                
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
            
        }
        .aspectRatio(1, contentMode: .fit) // 通过保持1:1的纵横比，徽章保持了它在视图中心的位置，即使它的祖先视图不是正方形的。

                        
    }
    
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

struct BadgeBackound_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackound()
    }
}
