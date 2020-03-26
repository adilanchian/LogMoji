//
//  ViewController.swift
//  LogMoji
//
//  Created by adilanchian on 08/11/2018.
//  Copyright (c) 2018 adilanchian. All rights reserved.
//

import UIKit
import LogMoji

enum Errors: String, State {
    case critical, success, warning
    
    var emoji: String {
        switch self {
        case .critical: return "🚨"
        case .success: return "✅"
        case .warning: return "⚠️"
        }
    }
    
    var name: String { self.rawValue }
}

class ViewController: UIViewController {
    
    //-- Properties --//
    @IBOutlet weak var successLogButton: UIButton!
    @IBOutlet weak var warningLogButton: UIButton!
    @IBOutlet weak var criticalLogButton: UIButton!
    
    //-- Actions --//
    @IBAction func logSuccesAction(_ sender: Any) {
        log(state: .success, message: "I am a successful LogMoji message!")
    }
    
    @IBAction func logWarningAction(_ sender: Any) {
        log(state: .warning, message: "I am a warning LogMoji message!")
    }
    
    @IBAction func logCriticalAction(_ sender: Any) {
        log(state: .critical, message: "I am a CRITICAL LogMoji message!")
    }
    
    func log(state: Errors, message: String) {
        LogMoji.logger.logWith(state: state, message: message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set button corner radius //
        self.successLogButton.layer.cornerRadius = 5.0
        self.warningLogButton.layer.cornerRadius = 5.0
        self.criticalLogButton.layer.cornerRadius = 5.0
        
        // Setup Logger Settings //
        LogMoji.logger.logToConsole(true)
        LogMoji.logger.setFilePath("Users/alecdilanchian/Desktop/testmoji.txt")
        LogMoji.logger.showTimeStamp(true)
    }
}
