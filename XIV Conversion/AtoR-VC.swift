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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearButtonLabel.setImage(SFSymbols.clear, for: .normal)
        deleteButtonLabel.setImage(SFSymbols.delete, for: .normal)
    }
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let numberChosen = sender.currentTitle! as String
        print(numberChosen)
        Conversion.arabicNumberValue = Conversion.arabicNumberValue + numberChosen
        updateModel()
    }
    
    
    
    @IBAction func clearValues() {
        Conversion.arabicNumberValue = ""
        updateModel()
    }
    
    
    @IBAction func deleteValues() {
        if Conversion.arabicNumberValue.count > 0 {
            Conversion.arabicNumberValue = String(Conversion.arabicNumberValue.dropLast())
            updateModel()
        }
    }
    
    
    func updateModel() {
        NotificationCenter.default.post(name: Notification.Name("didUpdateData"), object: nil)
    }
}
