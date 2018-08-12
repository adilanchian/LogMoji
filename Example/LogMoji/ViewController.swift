//
//  ViewController.swift
//  LogMoji
//
//  Created by adilanchian on 08/11/2018.
//  Copyright (c) 2018 adilanchian. All rights reserved.
//

import UIKit
import LogMoji

class ViewController: UIViewController {
    
    //-- Properties --//
    @IBOutlet weak var successLogButton: UIButton!
    @IBOutlet weak var warningLogButton: UIButton!
    @IBOutlet weak var criticalLogButton: UIButton!
    
    //-- Actions --//
    @IBAction func logSuccesAction(_ sender: Any) {
        LogMoji.logger.logWith(state: "success", message: "I am a successful LogMoji message!")
    }
    
    @IBAction func logWarningAction(_ sender: Any) {
        LogMoji.logger.logWith(state: "warning", message: "I am a warning LogMoji message!")
    }
    
    @IBAction func logCriticalAction(_ sender: Any) {
        LogMoji.logger.logWith(state: "critical", message: "I am a CRITICAL LogMoji message!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set button corner radius //
        self.successLogButton.layer.cornerRadius = 5.0
        self.warningLogButton.layer.cornerRadius = 5.0
        self.criticalLogButton.layer.cornerRadius = 5.0
        
        // Setup Logger Settings //
        LogMoji.logger.logToConsole(true)
        LogMoji.logger.showTimeStamp(true)
        
        // Setup States //
        LogMoji.logger.setStates([
            "success": "✅",
            "warning": "⚠️",
            "critical": "🚨"
        ])
        /* LogMoji.logger.logWith(state: "default", message: "This is a default emoji.")
        
        // Change default emoji //
        LogMoji.logger.changeDefaultState(emoji: "🔥")
        LogMoji.logger.logWith(state: "changeDefault", message: "This is a changed default.") */
    }
}
