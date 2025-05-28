import Foundation

public extension Date {
    /// Format the date using a predefined style
    /// - Parameter style: The date style to use for formatting
    /// - Returns: A formatted string representation of the date
    func formattedAs(_ style: DateStyle) -> String {
        if style == .relative {
            return relativeString
        }
        return style.formatter.string(from: self)
    }
    
    /// Get a relative string representation of the date (e.g., "2 hours ago")
    var relativeString: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: now)
        
        // If the date is in the future
        if self > now {
            return formatter.localizedString(for: self, relativeTo: now)
        }
        
        // If the date is in the past
        if let years = components.year, years > 0 {
            return "\(years) \(years == 1 ? "year" : "years") ago"
        }
        if let months = components.month, months > 0 {
            return "\(months) \(months == 1 ? "month" : "months") ago"
        }
        if let days = components.day, days > 0 {
            if days == 1 {
                return "yesterday"
            }
            return "\(days) days ago"
        }
        if let hours = components.hour, hours > 0 {
            return "\(hours) \(hours == 1 ? "hour" : "hours") ago"
        }
        if let minutes = components.minute, minutes > 0 {
            return "\(minutes) \(minutes == 1 ? "minute" : "minutes") ago"
        }
        if let seconds = components.second, seconds > 0 {
            if seconds < 5 {
                return "just now"
            }
            return "\(seconds) \(seconds == 1 ? "second" : "seconds") ago"
        }
        
        return "just now"
    }
    
    /// Add a number of seconds to the date
    func adding(seconds: Int) -> Date {
        Calendar.current.date(byAdding: .second, value: seconds, to: self) ?? self
    }
    
    /// Add a number of minutes to the date
    func adding(minutes: Int) -> Date {
        Calendar.current.date(byAdding: .minute, value: minutes, to: self) ?? self
    }
    
    /// Add a number of hours to the date
    func adding(hours: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? self
    }
    
    /// Add a number of days to the date
    func adding(days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    /// Add a number of weeks to the date
    func adding(weeks: Int) -> Date {
        Calendar.current.date(byAdding: .weekOfYear, value: weeks, to: self) ?? self
    }
    
    /// Add a number of months to the date
    func adding(months: Int) -> Date {
        Calendar.current.date(byAdding: .month, value: months, to: self) ?? self
    }
    
    /// Add a number of years to the date
    func adding(years: Int) -> Date {
        Calendar.current.date(byAdding: .year, value: years, to: self) ?? self
    }
    
    /// Subtract a number of seconds from the date
    func subtracting(seconds: Int) -> Date {
        adding(seconds: -seconds)
    }
    
    /// Subtract a number of minutes from the date
    func subtracting(minutes: Int) -> Date {
        adding(minutes: -minutes)
    }
    
    /// Subtract a number of hours from the date
    func subtracting(hours: Int) -> Date {
        adding(hours: -hours)
    }
    
    /// Subtract a number of days from the date
    func subtracting(days: Int) -> Date {
        adding(days: -days)
    }
    
    /// Subtract a number of weeks from the date
    func subtracting(weeks: Int) -> Date {
        adding(weeks: -weeks)
    }
    
    /// Subtract a number of months from the date
    func subtracting(months: Int) -> Date {
        adding(months: -months)
    }
    
    /// Subtract a number of years from the date
    func subtracting(years: Int) -> Date {
        adding(years: -years)
    }
} 