//
//  ViewController.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Keypads
    
    @IBOutlet weak var arabicKeypad: UIView!
    @IBOutlet weak var romanKeypad: UIView!
    @IBOutlet weak var keypadChooser: UISegmentedControl!
    
    
    // Display boxes
    
    @IBOutlet weak var romanDisplay: UILabel!
    @IBOutlet weak var arabicDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.romanKeypad.isHidden = true
        self.arabicKeypad.isHidden = false
        self.keypadChooser.selectedSegmentIndex = 1
        romanDisplay.text = Conversion.romanNumeralValue
        arabicDisplay.text = Conversion.arabicNumberValue
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(_:)), name: Notification.Name("didUpdateData"), object: nil)
    }

    
    @IBAction func showKeypad(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.romanKeypad.isHidden = false
                self.arabicKeypad.isHidden = true
            })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.romanKeypad.isHidden = true
                self.arabicKeypad.isHidden = false
            })
        }
    }

    
    @objc func updateUI(_ notification:Notification) {
        romanDisplay.text = Conversion.romanNumeralValue
        arabicDisplay.text = Conversion.arabicNumberValue
    }

    
}

