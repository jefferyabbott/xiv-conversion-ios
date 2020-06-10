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
        
        clearButtonLabel.setImage(SFSymbols.clear, for: .normal)
        deleteButtonLabel.setImage(SFSymbols.delete, for: .normal)
        displayOrHideZeroButton()
    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let numberChosen = sender.currentTitle! as String
        if Conversion.arabicNumberValue != "0" {
            Conversion.arabicNumberValue = Conversion.arabicNumberValue + numberChosen
        }
        else {
            Conversion.arabicNumberValue = numberChosen
        }
        
        Conversion.convertToRomanNumeral()
        displayOrHideZeroButton()
    }
    
    
    
    @IBAction func clearValues() {
        Conversion.arabicNumberValue = ""
        Conversion.convertToRomanNumeral()
        displayOrHideZeroButton()
    }
    
    
    
    @IBAction func deleteValues() {
        if Conversion.arabicNumberValue.count > 0 {
            Conversion.arabicNumberValue = String(Conversion.arabicNumberValue.dropLast())
            Conversion.convertToRomanNumeral()
        }
        displayOrHideZeroButton()
    }
    
    
    func displayOrHideZeroButton() {
        if Conversion.arabicNumberValue == "0" || Conversion.arabicNumberValue == "" {
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
    
    
 
}
