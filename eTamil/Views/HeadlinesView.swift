// HeadlinesView.swift
// View for displaying top headlines

import SwiftUI

struct HeadlinesView: View {
    @StateObject private var viewModel = HeadlinesViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading && viewModel.articles.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            Text(article.title)
                        }
                    }
                    .refreshable {
                        await viewModel.fetchHeadlines()
                    }
                }
            }
            .navigationTitle("Top Headlines")
        }
        .task {
            await viewModel.fetchHeadlines()
        }
    }
}

#Preview {
    HeadlinesView()
}
