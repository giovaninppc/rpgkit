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
    @IBOutlet var image: WKInterfaceImage!
    
    let diceArray = [2, 4, 6, 8, 10, 12, 20, 100]
    let diceName = ["Coin (D2)", "D4", "D6", "D8", "D10", "D12", "D20", "D100"]
    
    var selectedDice: Int = 0 {
        didSet {
            image.setImage(UIImage(named: "\(diceName[selectedDice])-1"))
        }
    }
    
    var shaker: WatchShaker = WatchShaker(shakeSensibility: .shakeSensibilityHardest, delay: 0.2)
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        slider.setNumberOfSteps(diceArray.count - 1)
        whichDice.setText("\(diceName[2])")
        selectedDice = 2
        image.stopAnimating()
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
        if intValue == selectedDice {
            WKInterfaceDevice.current().play(.retry)
        } else if intValue < 0 {
            intValue = 0
            WKInterfaceDevice.current().play(.failure)
        } else {
            WKInterfaceDevice.current().play(.click)
        }
        selectedDice = intValue
        whichDice.setText("\(diceName[intValue])")
    }
    
    /// Make dice animation
    func shakeDice() {
        image.setImageNamed("\(diceName[selectedDice])-")
        image.startAnimatingWithImages(in: NSRange(location: 0,
                                                   length: diceArray[selectedDice]-1),
                                       duration: 0.2, repeatCount: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.stopDice()
        })
    }
    
    /// Stop dice animation and set image to random number
    func stopDice() {
        image.stopAnimating()
        let random = arc4random_uniform(UInt32(diceArray[selectedDice])) + 1
        image.setImage(UIImage(named: "\(diceName[selectedDice])-\(random)"))
    }
    
}

extension DiceController: WatchShakerDelegate {
    func watchShakerDidShake(_ watchShaker: WatchShaker) {
        WKInterfaceDevice.current().play(.start)
        shakeDice()
    }
    
    func watchShaker(_ watchShaker: WatchShaker, didFailWith error: Error) {
        print(error.localizedDescription)
    }
}
