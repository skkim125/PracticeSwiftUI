//
//  CoinView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/4/24.
//

import SwiftUI

struct CoinView: View {
    @State private var search = ""
    @State private var datas: [Coin] = []
    @State private var filterDatas: [Coin] = []
    
    var body: some View {
        NavigationView {
            coinListView()
                .navigationTitle("나의 마켓")
                .searchable(text: $search)
                .onChange(of: search) {
                    if search.isEmpty {
                        filterDatas = datas
                    }
                }
                .onSubmit(of: .search) {
                    filterDatas = search.isEmpty ? datas : datas.filter({ $0.koreanName.contains(search) })
                }
        }
        .onAppear {
            UpbitAPI.fetchAllMarket { array in
                datas = array
                filterDatas = datas
            }
        }
    }
    
    func coinListView() -> some View {
        ScrollView {
            LazyVStack {
                ForEach($filterDatas, id: \.market) { $coin in
                    NavigationLink {
                        NavigationLazyView(CoinRowView(coin: $coin))
                    } label: {
                        CoinRowView(coin: $coin)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct CoinRowView: View {
    @Binding var coin: Coin
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(coin.koreanName)
                    .font(.title3)
                    .bold()
                
                Text(coin.market)
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
            
            Spacer()
            
            Text(coin.englishName)
            
            Button {
                coin.isLike.toggle()
            } label: {
                Image(systemName: coin.isLike ? "heart.fill" : "heart")
                    .foregroundStyle(.red)
            }
        }
        .foregroundStyle(.black)
        .padding(.horizontal)
        .padding(.bottom)
    }
}

#Preview {
    CoinView()
}
