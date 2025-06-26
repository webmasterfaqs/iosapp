//
//  ContentView.swift
//  eTamil
//
//  Created by Umasankar Ramamoorthy on 2025-06-26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HeadlinesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.articles, id: \Article.id) { (article: Article) in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    Text(article.title)
                }
            }
            .refreshable {
                await viewModel.fetchHeadlines()
            }
            .navigationTitle("Top Headlines")
        }
        .onAppear {
            Task {
                await viewModel.fetchHeadlines()
            }
        }
    }
}

#Preview {
    ContentView()
}
