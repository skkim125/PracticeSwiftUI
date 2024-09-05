//
//  NavigationLazyView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/4/24.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let closure: () -> Content
    
    var body: some View {
        closure()
    }
    
    init(_ closure: @autoclosure @escaping () -> Content) {
        self.closure = closure
    }
}
