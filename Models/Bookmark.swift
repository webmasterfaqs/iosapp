// Bookmark.swift
// Model for bookmarked articles

import Foundation

struct Bookmark: Identifiable, Codable {
    var id: String { articleURL }
    let articleURL: String
    let title: String
    let imageUrl: String?
    let savedAt: Date
    // TODO: Add more fields as needed
}
