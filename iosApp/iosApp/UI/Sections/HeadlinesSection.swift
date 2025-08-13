//
//  HeadlinesSection.swift
//  Infiniti News IOS
//
//  Created by Hassaan Raza on 26/10/2024.
//

import SwiftUI
import Shared

struct HeadlinesSection: View {
    
    let articles : [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
    var body: some View {
        VStack {
            Text(BREAKING_NEWS)
                .font(.headline)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(articles, id: \.self) { article in
                        ArticleItem(article: article, width:350, height: 300)
                    }
                }
            }
        }
    }
}
