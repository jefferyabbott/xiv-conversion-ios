//
//  RtoA-VC.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import UIKit

class RtoA_VC: UIViewController {

    
    var romanNumber = ""
    
    @IBOutlet weak var clearButtonLabel: UIButton!
    @IBOutlet weak var deleteButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearButtonLabel.setImage(SFSymbols.clear, for: .normal)
        deleteButtonLabel.setImage(SFSymbols.delete, for: .normal)
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
        
    }

    
    func displayOrHideButtons() {
        
    }

}
