//
//  ProfileImageButtonWrapper.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/2/24.
//

import SwiftUI

private struct CircleButtonModifier: ViewModifier {
    let borderColor: Color
    let lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .foregroundStyle(borderColor)
            }
    }
}

extension View {
    func asCircleButtonModifier(borderColor: Color, lineWidth: CGFloat) -> some View {
        modifier(CircleButtonModifier(borderColor: borderColor, lineWidth: lineWidth))
    }
    
}
