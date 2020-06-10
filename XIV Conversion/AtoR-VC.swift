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
        
        clearButtonLabel.setImage(SFSymbols.clear, for: .normal)
        deleteButtonLabel.setImage(SFSymbols.delete, for: .normal)
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
            zeroButton.isEnabled = false
            zeroButton.alpha = 0.5
            clearButtonLabel.isEnabled = false
            clearButtonLabel.alpha = 0.5
            deleteButtonLabel.isEnabled = false
            deleteButtonLabel.alpha = 0.5
        }
        else {
            zeroButton.isEnabled = true
            zeroButton.alpha = 1.0
            clearButtonLabel.isEnabled = true
            clearButtonLabel.alpha = 1.0
            deleteButtonLabel.isEnabled = true
            deleteButtonLabel.alpha = 1.0
        }
    }
    
    
    
    @objc func updateButtons(_ notification:Notification) {
        displayOrHideButtons()
    }
 
}
