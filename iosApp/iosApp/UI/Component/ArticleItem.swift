//
//  ArticleItem.swift
//  Infiniti News IOS
//
//  Created by Hassaan Raza on 26/10/2024.
//

import SwiftUI
import Shared

struct ArticleItem: View {
    let article: Article
    let width : CGFloat?
    let height: CGFloat?
    let callback: ()
    init(article: Article, width: CGFloat?, height: CGFloat? ) {
        self.article = article
        self.width = width
        self.height = height
    }
    var body: some View {
        if(article.urlToImage != nil) {
                AsyncImage(url: URL(string: article.urlToImage!)) { result in
                    switch result {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        NavigationLink(
                            destination: DetailScreen(article: article)) {
                                ZStack(alignment: .bottom) {
                                    image.resizable()
                                        .cornerRadius(25)
                                        .scaledToFit()
                                    
                                    Text(article.title).foregroundColor(.white)
                                }
                            }
                        
                    case .failure(let error):
                        Text(error.localizedDescription).foregroundColor(.white)
                    }
                    
                }.frame(width: width, height: height)
        }
    }
}
