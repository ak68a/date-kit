import Foundation

public extension Date {
    /// Format the date using a predefined style
    /// - Parameter style: The date style to use for formatting
    /// - Returns: A formatted string representation of the date
    func formattedAs(_ style: DateStyle) -> String {
        if style == .relative {
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            return formatter.localizedString(for: self, relativeTo: Date())
        }
        return style.formatter.string(from: self)
    }
    
    /// Get a relative string representation of the date (e.g., "2 hours ago")
    var relativeString: String {
        formattedAs(.relative)
    }
} 