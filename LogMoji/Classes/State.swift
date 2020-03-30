//
//  State.swift
//  LogMoji
//
//  Created by Mustafa Khalil on 3/26/20.
//

import Foundation

public protocol State {
    /// Emoji that would be used by the library to pretty print the logs
    var emoji: String { get }
    /// Name of the current state the library is on
    var name: String { get }
}

extension State {
    
    var fullString: String {
        return "\(emoji) \(name)"
    }
    
    var timeStampedString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.long
        return "[\(dateFormatter.string(from: Date()))] \(fullString)"
    }
    
    func withMessage(_ message: String, requiresTimeStamp: Bool) -> String {
        return requiresTimeStamp ? "\(timeStampedString) \(message)" : "\(fullString) \(message)"
    }
}
