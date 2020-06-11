
```
ice_cream_stores:
  ChIJ70taCKKAhYAR5IMmYwQT4Ts:
    placeId: ChIJ70taCKKAhYAR5IMmYwQT4Ts
    address: 432 Octavia St #1a, San Francisco, CA 94102, USA
    location: 37.7763629, -122.4241918
    name: Smitten Ice Cream
```

The collection name is referenced from `_HomePageState`'s `initState` method. The 
`placeId`, `address`, `location` and `name` are used at various points in the widget
tree to render appropriate data.

### Google Maps

You need to add a Google Maps SDK for iOS API key to `ios/Runner/AppDelegate.m`.
This enables the Google Map to render. You will also need to add a Google Maps 
Web Services API key to `lib/api_key.dart`.

To reiterate the warning that we gave during the talk, do not put Web Service API keys 
in your production binary. You need to build a proxy service to serve 
pre-authenticated content to your mobile applications so you can change API keys as 
required. We only did this to make it easy to demonstrate on stage.

## Questions/issues

If you have a general question about building with Google Maps in Flutter, the
best places to go are:

* [The FlutterDev Google Group](https://groups.google.com/forum/#!forum/flutter-dev)
* [The Flutter Gitter channel](https://gitter.im/flutter/flutter)
* [StackOverflow](https://stackoverflow.com/questions/tagged/flutter)

If you run into an issue with the sample itself, please file an issue
in the [main Flutter repo](https://github.com/flutter/flutter/issues).