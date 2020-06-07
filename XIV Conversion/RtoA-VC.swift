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
    



}
