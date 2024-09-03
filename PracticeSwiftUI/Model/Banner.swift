//
//  Banner.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/4/24.
//

import SwiftUI

struct Banner: Hashable, Identifiable {
    let id = UUID()
    var total = Int.random(in: 1000...5000) * 150
    let color = Color.random()
    
    var totalFormat: String {
        return String(total.formatted()) + "원"
    }
}
