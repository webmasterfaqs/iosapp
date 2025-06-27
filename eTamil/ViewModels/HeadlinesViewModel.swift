import SwiftUI
import Combine

class HeadlinesViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false

    private let apiClient: NewsAPIClient

    init(apiClient: NewsAPIClient = LiveNewsAPIClient()) {
        self.apiClient = apiClient
    }

    func fetchHeadlines() async {
        isLoading = true
        do {
            let fetchedArticles = try await apiClient.fetchTopHeadlines(section: .world, page: 1)
            DispatchQueue.main.async {
                self.articles = fetchedArticles
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            print("Error fetching headlines: \(error)")
        }
    }
}
