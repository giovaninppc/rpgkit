//
//  InterfaceController.swift
//  RPG Kit WatchKit Extension
//
//  Created by Giovani Nascimento Pereira on 13/06/18.
//  Copyright © 2018 Giovani Nascimento Pereira. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var lifeLabel: WKInterfaceLabel!
    
    var life: Int = 20 {
        didSet {
            lifeLabel.setText("\(life)")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func upButton() {
        WKInterfaceDevice.current().play(.click)
        life += 1
    }
    
    @IBAction func downButton() {
        life -= 1
        if life < 0 {
            life = 0
            WKInterfaceDevice.current().play(.failure)
        } else {
            WKInterfaceDevice.current().play(.click)
        }
    }
    
}
