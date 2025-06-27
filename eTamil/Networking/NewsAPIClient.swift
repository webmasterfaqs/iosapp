// NewsAPIClient.swift
// Protocol for news API client

import Foundation

protocol NewsAPIClient {
    func fetchTopHeadlines(section: Section, page: Int) async throws -> [Article]
    func searchArticles(query: String, page: Int) async throws -> [Article]
    // TODO: Add more API methods as needed
}
