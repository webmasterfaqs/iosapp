import Foundation

class LiveNewsAPIClient: NewsAPIClient {
    private let baseURL = "https://gnews.io/api/v4/top-headlines"
    private let apiKey = ProcessInfo.processInfo.environment["GNEWS_API_KEY"] ?? ""

    func fetchTopHeadlines(section: Section, page: Int) async throws -> [Article] {
        guard !apiKey.isEmpty else {
            throw APIError.missingAPIKey
        }

        let urlString = "\(baseURL)?lang=en&max=50&token=\(apiKey)"
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let articles = try JSONDecoder().decode([Article].self, from: data)
        return articles
    }

    func searchArticles(query: String, page: Int) async throws -> [Article] {
        // TODO: Implement search functionality
        return []
    }
}

enum APIError: Error {
    case missingAPIKey
    case invalidURL
    case decodingError
}
