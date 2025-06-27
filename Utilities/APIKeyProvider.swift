import Foundation

enum APIKeyProvider {
    static func gnewsAPIKey() -> String? {
        if let envKey = ProcessInfo.processInfo.environment["GNEWS_API_KEY"], !envKey.isEmpty {
            return envKey
        }
        if let url = Bundle.main.url(forResource: "GNewsAPIKey", withExtension: "plist"),
           let data = try? Data(contentsOf: url),
           let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
           let key = dict["GNEWS_API_KEY"] as? String, !key.isEmpty {
            return key
        }
        return nil
    }
}
