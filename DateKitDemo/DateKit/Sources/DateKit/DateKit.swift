// The Swift Programming Language
// https://docs.swift.org/swift-book

@_exported import Foundation

/// DateKit provides convenient date formatting utilities with predefined styles
public enum DateKit {
    /// The current version of DateKit
    public static let version = "1.0.0"
    
    /// Predefined date formatting styles
    public enum Style {
        /// Short time format (e.g., "3:45 PM")
        case shortTime
        /// Medium time format (e.g., "3:45:30 PM")
        case mediumTime
        /// Long time format (e.g., "3:45:30 PM PST")
        case longTime
        
        /// Short date format (e.g., "1/1/24")
        case shortDate
        /// Medium date format (e.g., "Jan 1, 2024")
        case mediumDate
        /// Long date format (e.g., "January 1, 2024")
        case longDate
        
        /// Short date and time format (e.g., "1/1/24, 3:45 PM")
        case shortDateTime
        /// Medium date and time format (e.g., "Jan 1, 2024, 3:45 PM")
        case mediumDateTime
        /// Long date and time format (e.g., "January 1, 2024 at 3:45 PM")
        case longDateTime
        
        /// ISO8601 format (e.g., "2024-01-01T15:45:30Z")
        case iso8601
        
        /// Relative time format (e.g., "2 hours ago")
        case relative
        
        var formatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.locale = Locale.current
            
            switch self {
            case .shortTime:
                formatter.dateStyle = .none
                formatter.timeStyle = .short
            case .mediumTime:
                formatter.dateStyle = .none
                formatter.timeStyle = .medium
            case .longTime:
                formatter.dateStyle = .none
                formatter.timeStyle = .long
                
            case .shortDate:
                formatter.dateStyle = .short
                formatter.timeStyle = .none
            case .mediumDate:
                formatter.dateStyle = .medium
                formatter.timeStyle = .none
            case .longDate:
                formatter.dateStyle = .long
                formatter.timeStyle = .none
                
            case .shortDateTime:
                formatter.dateStyle = .short
                formatter.timeStyle = .short
            case .mediumDateTime:
                formatter.dateStyle = .medium
                formatter.timeStyle = .medium
            case .longDateTime:
                formatter.dateStyle = .long
                formatter.timeStyle = .medium
                
            case .iso8601:
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
            case .relative:
                // This will be handled separately using RelativeDateTimeFormatter
                return formatter
            }
            
            return formatter
        }
    }
}

// Typealias for convenience
public typealias DateStyle = DateKit.Style

