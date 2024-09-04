//
//  UpbitAPI.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/4/24.
//

import Foundation

struct UpbitAPI {
    
    private init() { }

    static func fetchAllMarket(completion: @escaping ([Coin]) -> Void) {
        
        guard let url = URL(string: "https://api.upbit.com/v1/market/all") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let decodedData = try JSONDecoder().decode([Coin].self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

struct Coin: Hashable, Codable {
    let market, koreanName, englishName: String
    var isLike = false

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
