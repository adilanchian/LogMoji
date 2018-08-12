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
    
    public func changeDefaultState(emoji: String) {
        self.defaultState = emoji
    }
    
    //-- Logging --//
    public func logWith(state: String, message: String) {
        guard let validStates = self.states else {
            print("[LogMoji Error] 💩 States is nil. Logging with default emoji.")
            self.logWithMethod("\(self.defaultState) \(message)")
            return
        }
        
        if let stateVal = validStates[state] {
            self.logWithMethod("\(stateVal) \(message)")
        } else {
            self.logWithMethod("\(self.defaultState) \(message)")
        }
    }
    
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
    
    private func logToFile(_ path: String, _ message: String) {
        do {
            if FileManager.default.fileExists(atPath: path) {
                var fileContent = try String(contentsOfFile: path)
                
                if self.loggerSettings.willShowTimestamp() {
                    fileContent = "\(self.getTimestamp()) \(message)\n\(fileContent)"
                } else {
                    fileContent = "\(message)\n\(fileContent)"
                }
                
                let messageData = fileContent.data(using: .utf8)! as NSData
                
                try messageData.write(toFile: path, options: .atomicWrite)
            } else {
                if self.loggerSettings.willShowTimestamp() {
                    let content = "\(self.getTimestamp()) \(message)".data(using: .utf8)! as NSData
                    try content.write(toFile: path, options: .atomicWrite)
                } else {
                    let data = message.data(using: .utf8)! as NSData
                    try data.write(toFile: path, options: .atomicWrite)
                }
            }
        } catch {
            print("[LogMoji Error] 💩 \(error)")
        }
    }
    
    private func getTimestamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.long
        return "[\(dateFormatter.string(from: Date()))]"
    }
}
