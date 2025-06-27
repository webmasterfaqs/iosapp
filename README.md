# iosapp for dailyindia.com

This sample SwiftUI project fetches top headlines from the [GNews](https://gnews.io/) API.

## Setup

1. Obtain an API key from GNews.
2. Provide it to the app using either an environment variable or a plist file:
   - Environment variable: create a `.env` file at the repository root based on `.env.example` and set `GNEWS_API_KEY`.

   ```
   GNEWS_API_KEY=your_api_key_here
   ```

   - Plist: copy `GNewsAPIKey.plist.example` to `GNewsAPIKey.plist`, replace the value with your key, and add the file to the Xcode project.

The app checks for the environment variable first and falls back to the plist if present.

## Running

Open `eTamil.xcodeproj` in Xcode and run the `eTamil` scheme on an iOS simulator or device.
