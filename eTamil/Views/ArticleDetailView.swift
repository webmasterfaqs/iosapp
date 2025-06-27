import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let imageUrl = article.imageUrl {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                    }
                    .frame(height: 200)
                    .clipped()
                }
                
                if let description = article.description {
                    Text(description)
                        .font(.body)
                }
                
                if let content = article.content {
                    Text(content)
                        .font(.body)
                }
                
                HStack {
                    Text(article.source)
                        .font(.caption)
                    Spacer()
                    Text(article.publishedAt, style: .date)
                        .font(.caption)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArticleDetailView(article: Article(
        title: "Test Article",
        description: "This is a test description",
        content: "This is the full content of the article that would typically be much longer.",
        url: "https://example.com",
        imageUrl: nil,
        publishedAt: Date(),
        source: "Test Source"
    ))
}
