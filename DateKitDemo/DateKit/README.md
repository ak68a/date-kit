# DateKit

A lightweight Swift package that provides convenient date formatting utilities with predefined styles.

## Requirements

- iOS 17.0+
- Swift 6.1+

## Installation

### Swift Package Manager

Add DateKit to your project using Swift Package Manager:

1. In Xcode, go to File > Add Packages...
2. Enter the repository URL: `https://github.com/ak68a/date-kit.git`
3. Select the version you want to use
4. Click Add Package

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/ak68a/date-kit.git", from: "1.0.0")
]
```

## Usage

Import DateKit in your Swift file:

```swift
import DateKit
```

### Using the Namespace

You can use the `DateKit` namespace to access package information and types:

```swift
// Get package version
let version = DateKit.version  // "1.0.0"

// Use styles through the namespace
let style1 = DateKit.Style.shortTime

// Or use the typealias for convenience
let style2: DateStyle = .shortTime
```

### Direct Usage

You can use the Date extensions directly:

```swift
let date = Date()
date.formattedAs(.shortTime)    // "3:45 PM"
date.relativeString             // "2 hours ago"
```

### Basic Usage Examples

Format dates using predefined styles:

```swift
let date = Date()

// Time formats
date.formattedAs(.shortTime)    // "3:45 PM"
date.formattedAs(.mediumTime)   // "3:45:30 PM"
date.formattedAs(.longTime)     // "3:45:30 PM PST"

// Date formats
date.formattedAs(.shortDate)    // "1/1/24"
date.formattedAs(.mediumDate)   // "Jan 1, 2024"
date.formattedAs(.longDate)     // "January 1, 2024"

// Date and time formats
date.formattedAs(.shortDateTime)  // "1/1/24, 3:45 PM"
date.formattedAs(.mediumDateTime) // "Jan 1, 2024, 3:45 PM"
date.formattedAs(.longDateTime)   // "January 1, 2024 at 3:45 PM"

// ISO8601 format
date.formattedAs(.iso8601)      // "2024-01-01T15:45:30Z"

// Relative time
date.relativeString             // "2 hours ago"
// or
date.formattedAs(.relative)     // "2 hours ago"
```

### Available Styles

DateKit provides the following predefined styles through `DateKit.Style`:

#### Time Formats
- `.shortTime` - Short time format (e.g., "3:45 PM")
- `.mediumTime` - Medium time format (e.g., "3:45:30 PM")
- `.longTime` - Long time format (e.g., "3:45:30 PM PST")

#### Date Formats
- `.shortDate` - Short date format (e.g., "1/1/24")
- `.mediumDate` - Medium date format (e.g., "Jan 1, 2024")
- `.longDate` - Long date format (e.g., "January 1, 2024")

#### Date and Time Formats
- `.shortDateTime` - Short date and time format (e.g., "1/1/24, 3:45 PM")
- `.mediumDateTime` - Medium date and time format (e.g., "Jan 1, 2024, 3:45 PM")
- `.longDateTime` - Long date and time format (e.g., "January 1, 2024 at 3:45 PM")

#### Special Formats
- `.iso8601` - ISO8601 format (e.g., "2024-01-01T15:45:30Z")
- `.relative` - Relative time format (e.g., "2 hours ago")

### Localization

All date formats respect the user's locale settings. The formatting is handled using `DateFormatter` and `RelativeDateTimeFormatter` from Foundation, ensuring proper localization for all supported locales.

## API Reference

### DateStyle

An enum that defines various date formatting styles. You can use either `DateKit.Style` or the `DateStyle` typealias.

```swift
public typealias DateStyle = DateKit.Style

public enum DateKit.Style {
    case shortTime
    case mediumTime
    case longTime
    case shortDate
    case mediumDate
    case longDate
    case shortDateTime
    case mediumDateTime
    case longDateTime
    case iso8601
    case relative
}
```

### Date Extensions

#### formattedAs(_:)

Formats a date using a predefined style.

```swift
func formattedAs(_ style: DateStyle) -> String
```

#### relativeString

A computed property that returns a relative string representation of the date.

```swift
var relativeString: String
```

## License

This project is licensed under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 