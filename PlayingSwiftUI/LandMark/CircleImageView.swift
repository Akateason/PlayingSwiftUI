//
//  CircleImageView.swift
//  PlayingSwiftUI
//
//  Created by teason23 on 2022/3/5.
//

import SwiftUI

@available(iOS 15.0, *)
struct CircleImageView: View {
    var body: some View {
        Image("1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)

    }
}

@available(iOS 15.0, *)
struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
