//
//  HeadlinesSection.swift
//  Infiniti News IOS
//
//  Created by Hassaan Raza on 26/10/2024.
//

import SwiftUI
import Shared

struct AllNewsSection: View {
    let articles : [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
    var body: some View {
        VStack {
            Text(WHATS_HAPPENING_AROUND_THE_WORLD)
                .font(.headline)
            ScrollView(.vertical) {
                LazyVStack(spacing: 20) {
                    ForEach(articles, id: \.self) { article in
                        ArticleItem(article: article, width: .infinity, height: .infinity)
                    }
                }
            }
        }
    }
}

