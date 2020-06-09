//
//  Conversion.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import Foundation


struct Conversion {
    
    static var romanNumeralValue = "" {
        didSet {
            print("Roman Numeral Value has been set.")
            updateView()
        }
    }
    static var arabicNumberValue = "" {
        didSet {
            print("Arabic Number Value has been set.")
            updateView()
        }
    }
    
    static func updateView() {
        NotificationCenter.default.post(name: Notification.Name("didUpdateData"), object: nil)
    }
   

}
