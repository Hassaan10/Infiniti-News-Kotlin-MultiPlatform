//
//  DetailScreen.swift
//  Infiniti News IOS
//
//  Created by Hassaan Raza on 03/01/2025.
//

import SwiftUI
import Shared

struct DetailScreen: View {
    let article:Article
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack {
                    AsyncImage(url: URL(string: article.urlToImage!)) { result in
                        switch result {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .scaledToFill()
                                .frame(height: proxy.size.height/2)
                        case .failure(let error):
                            Text(error.localizedDescription).foregroundColor(.white)
                        }
                    }
        
                    Text(article.title)
                    Text(article.description)
                    Text(article.content ?? "No Content")
                }.frame(width: proxy.size.width)
            }
        }.contentMargins(20)
    }
}
