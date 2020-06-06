//
//  AtoR-VC.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import UIKit

class AtoR_VC: UIViewController {

    let clearSymbol = UIImage(systemName: "clear")
    let deleteSymbol = UIImage(systemName: "delete.left")
    
    
    
    @IBOutlet weak var clearButtonLabel: UIButton!
    
    @IBOutlet weak var deleteButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearButtonLabel.setTitle("", for: .normal)
        clearButtonLabel.setImage(clearSymbol, for: .normal)
        
        deleteButtonLabel.setTitle("", for: .normal)
        deleteButtonLabel.setImage(deleteSymbol,for: .normal)
    }
    
    

}
