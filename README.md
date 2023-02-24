# Logger

Logger of the project

## Documentation

[Module's documentation](https://github.com/iCookbook/Logger/wiki) is described in [GitHub Wiki](https://docs.github.com/en/communities/documenting-your-project-with-wikis/about-wikis).

## Usage

Just call `log` method of `Logger`:

```swift
Logger.log("Some warning's here.", logType: .warning)
Logger.log("Some information's here.", logType: .info, shouldLogContext: false)
```

And output would be like:

<img width="877" alt="image" src="https://user-images.githubusercontent.com/60363270/205673967-192b170c-0851-495b-b4d6-aba04226fcee.png">

---

For more details, read [GitHub Wiki](https://github.com/iCookbook/Logger/wiki) documentation
