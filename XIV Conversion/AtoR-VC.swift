//
//  AtoR-VC.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import UIKit

class AtoR_VC: UIViewController {

    var arabicNumberString = ""
    
    @IBOutlet weak var clearButtonLabel: UIButton!
    
    @IBOutlet weak var deleteButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearButtonLabel.setImage(SFSymbols.clear, for: .normal)
        deleteButtonLabel.setImage(SFSymbols.delete, for: .normal)
    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let numberChosen = sender.currentTitle! as String
        print(numberChosen)
    }
    
    
    
    @IBAction func clearValues() {
        arabicNumberString = ""
    }
    
    
    @IBAction func deleteValues() {
        if arabicNumberString.count > 0 {
            arabicNumberString = String(arabicNumberString.dropLast())
        }
    }
}
