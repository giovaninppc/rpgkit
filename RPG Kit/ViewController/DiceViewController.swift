//
//  DiceViewController.swift
//  RPG Kit
//
//  Created by Giovani Nascimento Pereira on 13/06/18.
//  Copyright © 2018 Giovani Nascimento Pereira. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    
    let diceArray = [2, 4, 6, 8, 10, 12, 20]
    let animationImages = [[#imageLiteral(resourceName: "D2-1"), #imageLiteral(resourceName: "D2-2")], [#imageLiteral(resourceName: "D4-1"), #imageLiteral(resourceName: "D4-2"), #imageLiteral(resourceName: "D4-3"), #imageLiteral(resourceName: "D4-4")], [#imageLiteral(resourceName: "D6-1"), #imageLiteral(resourceName: "D6-2"), #imageLiteral(resourceName: "D6-3"), #imageLiteral(resourceName: "D6-4"), #imageLiteral(resourceName: "D6-5"), #imageLiteral(resourceName: "D6-6")],
                           [#imageLiteral(resourceName: "D8-1"), #imageLiteral(resourceName: "D8-2"), #imageLiteral(resourceName: "D8-3"), #imageLiteral(resourceName: "D8-4"), #imageLiteral(resourceName: "D8-5"), #imageLiteral(resourceName: "D8-6"), #imageLiteral(resourceName: "D8-7"), #imageLiteral(resourceName: "D8-8")],
                           [#imageLiteral(resourceName: "D10-1"), #imageLiteral(resourceName: "D10-2"), #imageLiteral(resourceName: "D10-3"), #imageLiteral(resourceName: "D10-4"), #imageLiteral(resourceName: "D10-5"), #imageLiteral(resourceName: "D10-6"), #imageLiteral(resourceName: "D10-7"), #imageLiteral(resourceName: "D10-8"), #imageLiteral(resourceName: "D10-9"), #imageLiteral(resourceName: "D10-10")],
                           [#imageLiteral(resourceName: "D12-1"), #imageLiteral(resourceName: "D12-2"), #imageLiteral(resourceName: "D12-3"), #imageLiteral(resourceName: "D12-4"), #imageLiteral(resourceName: "D12-5"), #imageLiteral(resourceName: "D12-6"), #imageLiteral(resourceName: "D12-7"), #imageLiteral(resourceName: "D12-8"), #imageLiteral(resourceName: "D12-9"), #imageLiteral(resourceName: "D12-10"), #imageLiteral(resourceName: "D12-11"), #imageLiteral(resourceName: "D12-12")],
                           [#imageLiteral(resourceName: "D20-1"), #imageLiteral(resourceName: "D20-2"), #imageLiteral(resourceName: "D20-3"), #imageLiteral(resourceName: "D20-4"), #imageLiteral(resourceName: "D20-5"), #imageLiteral(resourceName: "D20-6"), #imageLiteral(resourceName: "D20-7"), #imageLiteral(resourceName: "D20-8"), #imageLiteral(resourceName: "D20-9"), #imageLiteral(resourceName: "D20-10"), #imageLiteral(resourceName: "D20-11"), #imageLiteral(resourceName: "D20-12"), #imageLiteral(resourceName: "D20-13"), #imageLiteral(resourceName: "D20-14"), #imageLiteral(resourceName: "D20-15"), #imageLiteral(resourceName: "D20-16"), #imageLiteral(resourceName: "D20-17"), #imageLiteral(resourceName: "D20-18"), #imageLiteral(resourceName: "D20-19"), #imageLiteral(resourceName: "D20-20")]]
    let diceName = ["D2", "D4", "D6", "D8", "D10", "D12", "D20"]
    
    var selectedDice: Int = 0 {
        didSet {
            image.image = UIImage(named: "\(diceName[selectedDice])-1")
            diceLabel.text = "\(diceName[selectedDice])"
        }
    }

    @IBOutlet weak var diceLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDice = 3
    }

    
    @IBAction func sliderValueChanged(_ sender: Any) {
        selectedDice = Int(floor(slider.value))
    }
    
    @IBAction func sliderEditingDidEnd(_ sender: Any) {
        slider.value = Float(floor(slider.value))
    }
    
    @objc func shakeDice() {
        image.animationImages = animationImages[selectedDice]
        image.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.stopDice()
        })
    }
    
    func stopDice() {
        image.stopAnimating()
        let random = arc4random_uniform(UInt32(diceArray[selectedDice])) + 1
        image.image = UIImage(named: "\(diceName[selectedDice])-\(random)")
    }
    
    @IBAction func diceTap(_ sender: Any) {
        shakeDice()
    }
}
