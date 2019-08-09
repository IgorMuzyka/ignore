# ⚠️ ignore

A Swift Package that allows you to ignore you `Package.swift` dependencies warnings.

# Usage

Define `IgnoreConfig` at the very bottom of you `Package.swift` like this.

```swift
#if canImport(IgnoreConfig)
import IgnoreConfig

// add the list of targets you wish to preserve the warnings for as excluded
IgnoreConfig(excludedTargets: ["YourMainTarget", "SomeOtherTargetOfYours"]).write()
#endif

```

Whenever you add another dependency with warnings just or regenerate **xcodeproj** just run this from directory with your `Package.swift`.

```bash
swift run phase
```

# Installation

Add dependency to dependencies in your project `Package.swift`

```swift
dependencies: [
    .package(url: "https://github.com/IgorMuzyka/ignore", from: "0.0.2"),
]
```

Add target `PackageConfigs` to your targets and list the `IgnoreConfig` there:

```swift
.target(name: "PackageConfigs", dependencies: [
    "IgnoreConfig",
])
```

To make sure you can run `ignore` run this in your project directory with `Package.swift`

```bash
swift run package-config # builds PackageConfigs dependencies
```

