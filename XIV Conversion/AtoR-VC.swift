//
//  AtoR-VC.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import UIKit

class AtoR_VC: UIViewController {
    
    
    
    @IBOutlet weak var clearButtonLabel: UIButton!
    @IBOutlet weak var deleteButtonLabel: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateButtons(_:)), name: Notification.Name("didSwitchToArabicNumberKeypad"), object: nil)
        displayOrHideButtons()
    }
    
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let numberChosen = sender.currentTitle! as String
        let newValue = Conversion.arabicNumberValue + numberChosen
        
        if Int(newValue) ?? 0 > 10000 {
            let alert = UIAlertController(title: "Max Exceeded", message: "XIV Conversion handles numbers less than 10,000.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            Conversion.arabicNumberValue = newValue
            deleteValues()
        }
        
        else {
            if Conversion.arabicNumberValue != "0" {
                Conversion.arabicNumberValue = newValue
            }
            else {
                Conversion.arabicNumberValue = numberChosen
            }
            
            Conversion.convertToRomanNumeral()
            displayOrHideButtons()
        }
        
    }
    
    
    
    @IBAction func clearValues() {
        Conversion.arabicNumberValue = ""
        Conversion.romanNumeralValue = ""
        Conversion.updateView()
        displayOrHideButtons()
    }
    
    
    
    @IBAction func deleteValues() {
        if Conversion.arabicNumberValue.count > 0 {
            Conversion.arabicNumberValue = String(Conversion.arabicNumberValue.dropLast())
            Conversion.convertToRomanNumeral()
        }
        displayOrHideButtons()
    }
    
    
    func displayOrHideButtons() {
        if Conversion.arabicNumberValue == "" {
            disableButton(button: zeroButton)
            disableButton(button: clearButtonLabel)
            disableButton(button: deleteButtonLabel)
        }
        else {
            enableButton(button: zeroButton)
            enableButton(button: clearButtonLabel)
            enableButton(button: deleteButtonLabel)
        }
    }
    
    
    func disableButton(button: UIButton) {
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    
    
    func enableButton(button: UIButton) {
        button.isEnabled = true
        button.alpha = 1.0
    }
    
    
    
    @objc func updateButtons(_ notification:Notification) {
        displayOrHideButtons()
    }
 
}
