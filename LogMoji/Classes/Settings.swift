//
//  LogSettings.swift
//  LogMoji
//
//  Created by Alec Dilanchian on 8/11/18.
//

import Foundation

internal class Settings {
    //-- Properties --//
    private var logToConsole: Bool
    private var showTimestamp: Bool
    private var filePath: String?
    
    init() {
        self.logToConsole = true
        self.showTimestamp = true
        self.filePath = nil
    }
    
    //-- Set/Edit Properties --//
    public func logToConsole(_ value: Bool) {
        self.logToConsole = value
    }
    
    public func showTimeStamp(_ value: Bool) {
        self.showTimestamp = value
    }
    
    public func setFilePath(_ path: String?) {
        self.filePath = path
    }
    
    //-- Settings option checks --//
    public func canLogToConsole() -> Bool {
        return self.logToConsole
    }
    
    public func willShowTimestamp() -> Bool {
        return self.showTimestamp
    }
    
    public func getFilePath() -> String? {
        return self.filePath
    }
}
