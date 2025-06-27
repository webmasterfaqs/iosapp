import Foundation

enum APIKeyProvider {
    /// Built-in fallback key used if no environment or plist key is found.
    /// Provided by the user for testing purposes.
    private static let defaultAPIKey = "398eff08263b1e6180096acb4ab68a01"

    static func gnewsAPIKey() -> String {
        if let envKey = ProcessInfo.processInfo.environment["GNEWS_API_KEY"], !envKey.isEmpty {
            return envKey
        }
        if let url = Bundle.main.url(forResource: "GNewsAPIKey", withExtension: "plist"),
           let data = try? Data(contentsOf: url),
           let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
           let key = dict["GNEWS_API_KEY"] as? String, !key.isEmpty {
            return key
        }
        // Fall back to the bundled default key
        return defaultAPIKey
    }
}
