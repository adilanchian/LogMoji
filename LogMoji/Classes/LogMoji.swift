//
//  LogMoji.swift
//  LogMoji
//
//  Created by Alec Dilanchian on 8/11/18.
//

import Foundation


public class LogMoji {
    //-- Properties --//
    public static let logger = LogMoji()
    private var loggerSettings = Settings()
    private var defaultState: String = "❓"
    private var states: Dictionary<String, String>? = nil
    
    public init() {}
    
    //-- Methods --//
    public func setStates(_ states: Dictionary<String, String>) {
        self.states = states
    }
    
    //-- Settings --//
    public func logToConsole(_ value: Bool) {
        self.loggerSettings.logToConsole(value)
    }
    
    public func showTimeStamp(_ value: Bool) {
        self.loggerSettings.showTimeStamp(value)
    }
    
    public func setFilePath(_ path: String?) {
        self.loggerSettings.setFilePath(path)
    }
    
    //-- Logging --//
    private func logWithMethod(_ message: String) {
        if self.loggerSettings.canLogToConsole() {
            if self.loggerSettings.willShowTimestamp() {
                print("\(self.getTimestamp()) \(message)")
            } else {
                print(message)
            }
        }
        
        if let path = loggerSettings.getFilePath() {
            self.logToFile(path, message)
        }
    }
    
    private func getTimestamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.long
        
        return "[\(dateFormatter.string(from: Date()))]"
    }
    
    private func logToFile(_ path: String, _ message: String) {
        // Write to filePath //
        do {
            if FileManager.default.fileExists(atPath: path) {
                // Get content of file //
                var fileContent = try String(contentsOfFile: path)
                
                if self.loggerSettings.willShowTimestamp() {
                    fileContent = "\(self.getTimestamp()) \(message)\n\(fileContent)"
                } else {
                    fileContent = "\(message)\n\(fileContent)"
                }
                
                let messageData = fileContent.data(using: .utf8)! as NSData
                
                // Append data to string to write //
                try messageData.write(toFile: path, options: .atomicWrite)
            } else {
                // Append data to string to write //
                let data = message.data(using: .utf8)! as NSData
                try data.write(toFile: path, options: .atomicWrite)
            }
        } catch {
            print("\(error)")
        }
    }
    
    public func logWith(state: String, message: String) {
        guard let validStates = self.states else {
            print("States is nil. Need to log error.")
            return
        }
        
        if let stateVal = validStates[state] {
            self.logWithMethod("\(stateVal) \(message)")
        } else {
            self.logWithMethod("\(self.defaultState) \(message)")
        }
    }
    
    public func changeDefaultState(emoji: String) {
        self.defaultState = emoji
    }
}
