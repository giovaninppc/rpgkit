//
//  DiceController.swift
//  RPG Kit WatchKit Extension
//
//  Created by Giovani Nascimento Pereira on 13/06/18.
//  Copyright © 2018 Giovani Nascimento Pereira. All rights reserved.
//

import WatchKit
import Foundation


class DiceController: WKInterfaceController {

    @IBOutlet var slider: WKInterfaceSlider!
    
    @IBOutlet var whichDice: WKInterfaceLabel!
    
    @IBOutlet var imageView: WKInterfaceImage!
    
    
    let diceArray = [2, 4, 8, 10, 12, 20, 50, 100]
    let diceName = ["Coin (D2)", "D4", "D8", "D10", "D12", "D20", "D50", "D100"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        slider.setNumberOfSteps(diceArray.count)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func sliderChangeValue(_ value: Float) {
        let intValue = Int(value)
        whichDice.setText("\(diceName[intValue])")
    }
    
}
