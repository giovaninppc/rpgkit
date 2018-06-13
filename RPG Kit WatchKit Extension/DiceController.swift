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
    @IBOutlet var diceNumberLabel: WKInterfaceLabel!
    
    let diceArray = [2, 4, 8, 10, 12, 20, 50, 100]
    let diceName = ["Coin (D2)", "D4", "D8", "D10", "D12", "D20", "D50", "D100"]
    var lastValue: Int = 0
    
    var shaker: WatchShaker = WatchShaker(shakeSensibility: .shakeSensibilityNormal, delay: 0.2)
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        slider.setNumberOfSteps(diceArray.count - 1)
        whichDice.setText("\(diceName[3])")
        lastValue = 3
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        shaker.delegate = self
        shaker.start()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        shaker.stop()
    }
    
    @IBAction func sliderChangeValue(_ value: Float) {
        var intValue = Int(value)
        if intValue == lastValue {
            WKInterfaceDevice.current().play(.retry)
        } else if intValue < 0 {
            intValue = 0
            WKInterfaceDevice.current().play(.failure)
        } else {
            WKInterfaceDevice.current().play(.click)
        }
        lastValue = intValue
        whichDice.setText("\(diceName[intValue])")
    }
    
}

extension DiceController: WatchShakerDelegate {
    func watchShakerDidShake(_ watchShaker: WatchShaker) {
        print("YOU HAVE SHAKEN YOUR ⌚️⌚️⌚️")
        WKInterfaceDevice.current().play(.failure)
        diceNumberLabel.setText("SHAKE")
    }
    
    func watchShaker(_ watchShaker: WatchShaker, didFailWith error: Error) {
        print(error.localizedDescription)
    }
}
