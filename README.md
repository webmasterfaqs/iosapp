# iosapp for dailyindia.com

This sample SwiftUI project fetches top headlines from the [GNews](https://gnews.io/) API.

## Setup

1. Obtain an API key from GNews.
2. Create a `.env` file at the repository root based on `.env.example` and set `GNEWS_API_KEY`:

```
GNEWS_API_KEY=your_api_key_here
```

The app reads this environment variable at runtime to authenticate requests.

## Running

Open `eTamil.xcodeproj` in Xcode and run the `eTamil` scheme on an iOS simulator or device.
