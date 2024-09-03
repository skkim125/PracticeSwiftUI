//
//  MyMoneySearchView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/3/24.
//

import SwiftUI

struct MyMoneySearchView: View {
    @State private var search = ""
    let list =  dummy
    let banner = Banner(total: 2890000)
    var filterList: [Money] {
        return search.isEmpty ? list : list.filter { $0.product.contains(search) ||  $0.category.rawValue.lowercased().contains(search) }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView(banner)
                
                listView(list: filterList)
            }
            .navigationTitle("이번달 소비 내역")
            .searchable(text: $search, prompt: "소비 내역을 검색해보세요.")
        }
    }
    
    private func bannerView(_ banner: Banner) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.random().gradient)
            .frame(height: 150)
            .padding()
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("나의 소비 내역")
                        .font(.callout)
                    
                    Text("\(banner.totalFormat)")
                        .font(.title).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(40)
                .foregroundStyle(.white)
            }
    }
    
    private func listView(list: [Money]) -> some View {
        ForEach(list, id: \.id) { money in
            moneyView(money)
                .padding(.horizontal, 20)
                .padding(.bottom)
        }
    }
    
    private func moneyView(_ money: Money) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("\(money.product)")
                        .font(.title3).bold()
                    
                    Text("\(money.category.rawValue)")
                        .font(.caption)
                }
                
                Spacer()
                
                Text("\(money.amountFormat)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    MyMoneySearchView()
}

extension Color {
    static func random() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
