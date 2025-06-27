import Foundation

class LiveNewsAPIClient: NewsAPIClient {
    private let baseURL = "https://gnews.io/api/v4/top-headlines"
    private let apiKey = APIKeyProvider.gnewsAPIKey() ?? ""

    func fetchTopHeadlines(section: Section, page: Int) async throws -> [Article] {
        guard !apiKey.isEmpty else {
            throw APIError.missingAPIKey
        }

        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "max", value: "50"),
            URLQueryItem(name: "token", value: apiKey),
            URLQueryItem(name: "topic", value: section.apiTopic)
        ]

        guard let url = components?.url else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let response = try decoder.decode(GNewsResponse.self, from: data)
            return response.articles.map { $0.toArticle() }
        } catch {
            throw APIError.decodingError
        }
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

private struct GNewsResponse: Decodable {
    let articles: [GNewsArticle]
}

private struct GNewsArticle: Decodable {
    let title: String
    let description: String?
    let content: String?
    let url: String
    let image: String?
    let publishedAt: Date
    let source: Source

    struct Source: Decodable {
        let name: String
    }

    func toArticle() -> Article {
        Article(
            title: title,
            description: description,
            content: content,
            url: url,
            imageUrl: image,
            publishedAt: publishedAt,
            source: source.name
        )
    }
}
