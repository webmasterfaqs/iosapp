// Section.swift
// News section model

import Foundation

enum Section: String, CaseIterable, Codable, Identifiable {
    case world = "World"
    case business = "Business"
    case technology = "Technology"
    case sports = "Sports"
    case entertainment = "Entertainment"
    case science = "Science"
    case health = "Health"
    // TODO: Add more sections as needed
    var id: String { rawValue }
}
