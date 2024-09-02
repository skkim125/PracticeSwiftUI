//
//  PointButtonWrapper.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/2/24.
//

import SwiftUI

private struct PointButtonWrapper: ViewModifier {
    let textColor: Color
    let bgColor: Color
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            content
        }
        .asCustomButtomModifier(textColor: textColor, bgColor: bgColor)
    }
    
}

extension View {
    func asWrapToPointButton(textColor: Color, bgColor: Color, action: @escaping () -> Void) -> some View {
        modifier(PointButtonWrapper(textColor: textColor, bgColor: bgColor, action: action))
    }
    
}
