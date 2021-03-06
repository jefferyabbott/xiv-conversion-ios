//
//  RtoA-VC.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import UIKit

class RtoA_VC: UIViewController {

    
    @IBOutlet weak var clearButtonLabel: UIButton!
    @IBOutlet weak var deleteButtonLabel: UIButton!
    
    @IBOutlet weak var buttonI: UIButton!
    @IBOutlet weak var buttonV: UIButton!
    @IBOutlet weak var buttonX: UIButton!
    @IBOutlet weak var buttonL: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateButtons(_:)), name: Notification.Name("didSwitchToRomanNumeralKeypad"), object: nil)
        displayOrHideButtons()
    }
    
    
    
    
    @IBAction func numeralPressed(_ sender: UIButton) {
        let numeralChosen = sender.currentTitle! as String
        Conversion.romanNumeralValue = Conversion.romanNumeralValue + numeralChosen
        Conversion.convertToArabicNumber()
        displayOrHideButtons()
    }
    
    
    
    @IBAction func clearValues() {
        Conversion.arabicNumberValue = ""
        Conversion.romanNumeralValue = ""
        Conversion.updateView()
        displayOrHideButtons()
    }
    
    
    
    @IBAction func deleteValues() {
        if Conversion.romanNumeralValue.count > 0 {
            Conversion.romanNumeralValue = String(Conversion.romanNumeralValue.dropLast())
            Conversion.convertToArabicNumber()
        }
        displayOrHideButtons()
    }

    
    
    func displayOrHideButtons() {
        let currentValue = Conversion.romanNumeralValue
        
        // first enable all
        enableAllButtons()
        

        if currentValue == "" {
            disableButton(button: clearButtonLabel)
            disableButton(button: deleteButtonLabel)
        }
        else {
            enableButton(button: clearButtonLabel)
            enableButton(button: deleteButtonLabel)
        }
        
        // Rules for creating valid roman numerals:
        
        
        if currentValue.hasSuffix("IV") || currentValue.hasSuffix("IX") || currentValue.hasSuffix("III") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
            disableButton(button: buttonX)
            disableButton(button: buttonV)
            disableButton(button: buttonI)
            return
        }
        
        if currentValue.hasSuffix("II") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
            disableButton(button: buttonX)
            disableButton(button: buttonV)
            return
        }
        
        if currentValue.contains("I") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
        }
        
        if currentValue.contains("V") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
            disableButton(button: buttonX)
            disableButton(button: buttonV)
            return
        }
        
        if currentValue.contains("XX") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
        }
        
        if currentValue.contains("XXX") {
            disableButton(button: buttonX)
        }
        
        if currentValue.hasSuffix("XXXI") {
            enableButton(button: buttonX)
        }
        
        if currentValue.contains("XL") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
            disableButton(button: buttonX)
        }
        
        if currentValue.hasSuffix("XLI") {
            enableButton(button: buttonX)
        }
        
        if currentValue.contains("XC") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
        }
        
        if currentValue.contains("MMMMMMMMM") {
            disableButton(button: buttonM)
        }
        
        if currentValue.contains("D") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
        }
        
        if currentValue.contains("CC") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
        }
        
        if currentValue.contains("CCC") {
            disableButton(button: buttonC)
        }
        
        if currentValue.contains("L") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
            disableButton(button: buttonL)
        }
        
        if currentValue.contains("CM") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
        }
        
        if currentValue.contains("CD") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
        }
        
        if currentValue.hasSuffix("CDX") {
            enableButton(button: buttonC)
        }
        
        if currentValue.hasSuffix("CX") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            enableButton(button: buttonC)
        }
        
        if currentValue.contains("MCM") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
            disableButton(button: buttonC)
        }
        
        if currentValue.hasSuffix("CMX") {
            enableButton(button: buttonC)
        }
        
        if currentValue.contains("XC") {
            disableButton(button: buttonC)
            disableButton(button: buttonL)
            disableButton(button: buttonX)
        }
        
        if currentValue.hasSuffix("CI") {
            enableButton(button: buttonX)
        }
        
        if currentValue.hasSuffix("X") {
            disableButton(button: buttonM)
            disableButton(button: buttonD)
        }
        
    }

    
    
    func enableAllButtons() {
        enableButton(button: clearButtonLabel)
        enableButton(button: deleteButtonLabel)
        enableButton(button: buttonM)
        enableButton(button: buttonD)
        enableButton(button: buttonC)
        enableButton(button: buttonL)
        enableButton(button: buttonX)
        enableButton(button: buttonV)
        enableButton(button: buttonI)
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
