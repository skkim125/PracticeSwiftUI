//
//  SetProfileView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/2/24.
//

import SwiftUI

struct SetProfileView: View {
    @State private var profileNumber = Int.random(in: 0...10)
    @State private var nickname: String = ""
    
    @State private var mbtiDic: [Int: String] = [:]
    @State private var mbtiResult = ""
    
    @State private var isSheetPresneted = false
    
    let mbtiList = [["E", "N", "F", "J"],[ "I", "S", "T", "P"]]
    
    var body: some View {
        let buttonEnable = mbtiResult.count > 3 && !nickname.trimmingCharacters(in: .whitespaces).isEmpty
        
        VStack(spacing: 30) {
            NavigationLink {
                
            } label: {
                Image("profile_\(profileNumber)")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .asCircleButtonModifier(borderColor: .accentColor, lineWidth: 3)
            .padding(.top)
            
            VStack {
                TextField("닉네임을 설정해주세요", text: $nickname)
                    .textFieldStyle(.plain)
                
                Divider()
                    .overlay(.gray.opacity(0.7))
            }
            .padding(.horizontal, 30)
            
            HStack(alignment: .top) {
                Text("MBTI")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                mbtiButtonListView()
            }
            .padding(20)
            .padding(.horizontal, 10)
            
            Spacer()
            
            Text("완료")
                .asWrapToPointButton(textColor: .white, bgColor: buttonEnable ? .blue : .gray) {
                    isSheetPresneted.toggle()
                }
                .padding(.horizontal)
                .padding()
                .disabled(!buttonEnable)
                .sheet(isPresented: $isSheetPresneted) {
                    SignUpCompleteView(nickname: $nickname, mbti: $mbtiResult)
                }
                .onChange(of: mbtiDic) {
                    resultMBTI()
                }
        }
        .navigationTitle("PROFILE SETTING")
    }
    
    func mbtiButtonListView() -> some View {
        VStack {
            ForEach(0..<mbtiList.count) { index in
                HStack {
                    ForEach(0..<mbtiList[index].count) { i in
                        MBTIButton(mbtiDic: $mbtiDic, index: i, mbti: mbtiList[index][i])
                    }
                }
            }
        }
    }
    
    private func resultMBTI() {
        mbtiResult = mbtiDic.sorted(by: { $0.key < $1.key }).reduce(into: "") { result, dics in
            result += dics.value
        }
    }
}

struct MBTIButton: View {
    @Binding var mbtiDic: [Int: String]
    let index: Int
    let mbti: String
    
    var body: some View {
        let isInMBTI = (mbtiDic[index] == mbti)
        Text(mbti)
            .frame(width: 40, height: 40)
            .asWrapToPointButton(textColor: isInMBTI ? .white : .gray, bgColor: isInMBTI ? .blue : .white) {
                if isInMBTI {
                    mbtiDic[index] = ""
                } else {
                    mbtiDic[index] = mbti
                }
            }
            .asCircleButtonModifier(borderColor: isInMBTI ? .blue : .gray, lineWidth: 1)
    }
}

#Preview {
    SetProfileView()
}
