npm install -g expo-cli eas-cli

npx create-expo-app docgpt-mobile
cd docgpt-mobile

# Copy over the latest App.js code
# Add assets/icon.png and assets/splash.png to the assets folder

# Add the app configuration
cat <<EOF > app.json
{
  "expo": {
    "name": "DOC GPT",
    "slug": "doc-gpt",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "splash": {
      "image": "./assets/splash.png",
      "resizeMode": "contain",
      "backgroundColor": "#ffffff"
    },
    "assetBundlePatterns": ["**/*"],
    "ios": {
      "bundleIdentifier": "com.docgpt.mobile",
      "supportsTablet": true
    },
    "android": {
      "package": "com.docgpt.mobile",
      "adaptiveIcon": {
        "foregroundImage": "./assets/icon.png",
        "backgroundColor": "#ffffff"
      }
    },
    "web": {
      "favicon": "./assets/icon.png"
    }
  }
}
EOF

# Authenticate with Expo and configure build
npx expo login
eas build:configure

# Build for Android and iOS
# Android (.aab)
eas build --platform android
# iOS (.ipa)
eas build --platform ios
