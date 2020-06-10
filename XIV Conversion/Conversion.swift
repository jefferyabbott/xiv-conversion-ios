//
//  Conversion.swift
//  XIV Conversion
//
//  Created by Jeffery Abbott on 6/6/20.
//  Copyright © 2020 Jeffery Abbott. All rights reserved.
//

import Foundation


struct Conversion {
    
    static var romanNumeralValue = ""
    static var arabicNumberValue = ""
    
    static func updateView() {
        NotificationCenter.default.post(name: Notification.Name("didUpdateData"), object: nil)
    }
   

    
    static func convertToRomanNumeral() {
        var number = Int(Conversion.arabicNumberValue) ?? 0
        let num = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
        let sym = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]
        var i = 12
        var result = ""
        while(number > 0)
        {
          var div = number / num[i]
          number = number % num[i]
            
          while(div > 0)
          {
            result = result + sym[i]
            div = div - 1
          }
          i = i - 1
        }
        Conversion.romanNumeralValue = result as String
        updateView()
    }
}
