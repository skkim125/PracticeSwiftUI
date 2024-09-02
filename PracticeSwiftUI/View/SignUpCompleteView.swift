//
//  SignUpCompleteView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/2/24.
//

import SwiftUI

struct SignUpCompleteView: View {
    @Binding var nickname: String
    @Binding var mbti: String
    var body: some View {
        Text("\(mbti) \(nickname)님,\n회원가입이 완료되었습니다.")
    }
}

#Preview {
    SignUpCompleteView(nickname: .constant(""), mbti: .constant(""))
}
