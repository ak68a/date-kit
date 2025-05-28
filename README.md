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

// Relative time formatting
let now = Date()

// Past dates
now.subtracting(seconds: 1).relativeString    // "just now"
now.subtracting(seconds: 5).relativeString    // "5 seconds ago"
now.subtracting(minutes: 1).relativeString    // "1 minute ago"
now.subtracting(hours: 1).relativeString      // "1 hour ago"
now.subtracting(days: 1).relativeString       // "yesterday"
now.subtracting(days: 2).relativeString       // "2 days ago"
now.subtracting(months: 1).relativeString     // "1 month ago"
now.subtracting(years: 1).relativeString      // "1 year ago"

// Future dates
now.adding(minutes: 1).relativeString         // "in 1 minute"
now.adding(hours: 1).relativeString           // "in 1 hour"
now.adding(days: 1).relativeString            // "in 1 day"
now.adding(days: 2).relativeString            // "in 2 days"

// Date manipulation
let date = Date()
date.adding(hours: 2)      // Add 2 hours
date.subtracting(days: 1)  // Subtract 1 day
date.adding(weeks: 1)      // Add 1 week
date.subtracting(months: 1) // Subtract 1 month
```

### Date Manipulation

DateKit provides convenient methods for date manipulation using Calendar and DateComponents:

```swift
// Adding time
date.adding(seconds: 30)
date.adding(minutes: 15)
date.adding(hours: 2)
date.adding(days: 1)
date.adding(weeks: 1)
date.adding(months: 1)
date.adding(years: 1)

// Subtracting time
date.subtracting(seconds: 30)
date.subtracting(minutes: 15)
date.subtracting(hours: 2)
date.subtracting(days: 1)
date.subtracting(weeks: 1)
date.subtracting(months: 1)
date.subtracting(years: 1)
```

These methods use Calendar and DateComponents under the hood, which properly handle:
- Month boundaries
- Leap years
- Daylight saving time changes
- Different calendar systems

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
- `.relative` - Relative time format with natural language:
  - "just now" (for < 5 seconds)
  - "X seconds ago" (for ≥ 5 seconds)
  - "X minutes ago"
  - "X hours ago"
  - "yesterday" (for 1 day ago)
  - "X days ago"
  - "X months ago"
  - "X years ago"
  - "in X time" (for future dates)

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