//
//  ViewController.swift
//  RPG Kit
//
//  Created by Giovani Nascimento Pereira on 13/06/18.
//  Copyright © 2018 Giovani Nascimento Pereira. All rights reserved.
//

import UIKit

class LifeViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    var counter: Int = 20 {
        didSet {
            numberLabel.text = "\(counter)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaultsManager.getNumberExecution() == 1 {
            let alert = UIAlertController(title: "Welcome", message: "This app is supposed to help players on RPG tables. New features are comming but enjoy the Counter and dices, as also our Apple Watch app!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func upButton(_ sender: Any) {
        counter += 1
    }
    
    @IBAction func downButton(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            counter = 0
        }
    }
    
}

