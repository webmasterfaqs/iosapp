// Article.swift
// Model for news article

import Foundation

struct Article: Identifiable, Codable {
    var id: String { url }
    let title: String
    let description: String?
    let content: String?
    let url: String
    let imageUrl: String?
    let publishedAt: Date
    let source: String
    // TODO: Add more fields as needed
}
