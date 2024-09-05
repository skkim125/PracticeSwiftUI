//
//  CategoryView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/5/24.
//

import SwiftUI

struct MovieCategory {
    let id = UUID()
    let title: String
    let count: Int
}

struct CategoryView: View {
    let categoryStringArray = ["로맨스", "액션", "SF", "스릴러", "공포"]
    @State private var text = ""
    @State private var categoryArray = [MovieCategory(title: "로맨스", count: 0), MovieCategory(title: "액션", count: 1), MovieCategory(title: "SF", count: 2), MovieCategory(title: "스릴러", count: 3), MovieCategory(title: "공포", count: 4) ]
    
    var body: some View {
        NavigationView {
            List(categoryArray, id: \.id) { item in
                VStack {
                    Text("\(item.title) \(item.count)")
                }
            }
            .navigationTitle("카테고리")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newCategory = MovieCategory(title: categoryStringArray.randomElement()!, count: Int.random(in: 0...100))
                        categoryArray.append(newCategory)
                    } label: {
                        Text("추가")
                    }
                }
            }
            .searchable(text: $text, placement: .toolbar)
        }
    }
}

#Preview {
    CategoryView()
}
