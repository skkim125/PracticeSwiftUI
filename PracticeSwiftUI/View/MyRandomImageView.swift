//
//  MyRandomImageView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/5/24.
//

import SwiftUI

struct MovieSection: Identifiable {
    let id = UUID()
    var sectionName: String
}

struct MyRandomImageView: View {
    @State private var sections: [MovieSection] = [MovieSection(sectionName: "다음달 개봉 영화"), MovieSection(sectionName: "이번주 핫한 영화"), MovieSection(sectionName: "다시 뜨고 있는 영화")]
    @State var imageDetail: Image? = nil
    
    var body: some View {
        NavigationView {
            movieView()
        }
    }
    
    func movieView() -> some View {
        ScrollView {
            LazyVStack {
                ForEach($sections, id: \.id) { $section in
                    SectionView(section: $section)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    randomImageListView(section: $section)
                }
            }
        }
    }
    
    func randomImageListView(section: Binding<MovieSection>) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<30, id: \.self) { _ in
                    RandomImageView(section: section)
                }
            }
        }
    }
}

struct SectionView: View {
    @Binding var section: MovieSection
    
    var body: some View {
        
        Text(section.sectionName)
            .padding()
            .font(.title3)
            .bold()
    }
}

struct ImageDetailView: View {
    @Binding var section: MovieSection
    
    let image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 200, height: 300)
            
            TextField("", text: $section.sectionName)
                .padding(.horizontal)
        }
    }
}

struct RandomImageView: View {
    @Binding var section: MovieSection
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://picsum.photos/200/300")) { image in
            
            switch image {
                
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 300)
                
            case .success(let image):
                NavigationLink {
                    ImageDetailView(section: $section, image: image)
                } label: {
                    image
                        .resizable()
                        .frame(width: 200, height: 300)
                }
                
            case .failure:
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 200, height: 300)
                
            @unknown default:
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 200, height: 300)
            }
        }
        .clipShape(.rect(cornerRadius: 12))
        .padding(.horizontal, 20)
    }
}

#Preview {
    MyRandomImageView()
}
