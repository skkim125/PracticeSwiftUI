//
//  CustomButtonModifier.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/2/24.
//

import SwiftUI

private struct CustomButtonModifier: ViewModifier {
    let textColor: Color
    let bgColor: Color
    
    func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundStyle(textColor)
                .background(bgColor, in: .capsule)
    }
}

extension View {
    func asCustomButtomModifier(textColor: Color, bgColor: Color) -> some View {
        modifier(CustomButtonModifier(textColor: textColor, bgColor: bgColor))
    }

}
