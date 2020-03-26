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
    
    public init() {}
        
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
    public func logWith(state: State, message: String) {
        logWithMethod(state: state, message)
    }
    
    private func logWithMethod(state: State, _ message: String) {
        if let path = loggerSettings.getFilePath() {
            logToFile(path, state: state, message: message)
        }
        
        if !loggerSettings.canLogToConsole() {
           return
        }
        print(state.withMessage(message, requiresTimeStamp: loggerSettings.willShowTimestamp()))
    }
    
    private func logToFile(_ path: String, state: State, message: String) {
        do {
            let log = state.withMessage(message, requiresTimeStamp: loggerSettings.willShowTimestamp())
            if FileManager.default.fileExists(atPath: path) {
                var fileContent = try String(contentsOfFile: path)
                fileContent = "\(fileContent)\n\(log)"
                
                let messageData = fileContent.data(using: .utf8)! as NSData
                
                try messageData.write(toFile: path, options: .atomicWrite)
            } else {
                if self.loggerSettings.willShowTimestamp() {
                    let content = log.data(using: .utf8)! as NSData
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
}
