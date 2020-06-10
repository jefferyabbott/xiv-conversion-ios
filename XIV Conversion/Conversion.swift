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
    
    static let values = [
        "M": 1000,
        "D": 500,
        "C": 100,
        "L": 50,
        "X": 10,
        "V": 5,
        "I": 1
    ]
    
    static let numeralValues = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900 ,1000]
    static let symbols = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
    
    
    
    static func updateView() {
        NotificationCenter.default.post(name: Notification.Name("didUpdateData"), object: nil)
    }

    
    static func convertToRomanNumeral() {
        var number = Int(Conversion.arabicNumberValue) ?? 0
        var i = 12
        var result = ""
        while(number > 0)
        {
          var div = number / numeralValues[i]
          number = number % numeralValues[i]
            
          while(div > 0)
          {
            result = result + symbols[i]
            div = div - 1
          }
          i = i - 1
        }
        Conversion.romanNumeralValue = result as String
        updateView()
    }
    
    
    static func convertToArabicNumber() {
        
        var total = 0
        let charactersInRomanNumeral = Array(Conversion.romanNumeralValue)
        var current: String
        var currentValue: Int
        var next: String
        var nextValue: Int
        
        for i in 0..<charactersInRomanNumeral.count {
            current = "\(charactersInRomanNumeral[i])"
            currentValue = values[current]!
            if i + 1 < charactersInRomanNumeral.count {
                next = "\(charactersInRomanNumeral[i + 1])"
                nextValue = values[next]!
                if currentValue < nextValue {
                    total = total - currentValue
                }
                else {
                    total = total + currentValue
                }
            }
            else {
                total = total + currentValue
            }
        }
        
        if total == 0 {
            Conversion.arabicNumberValue = ""
        }
        else {
            Conversion.arabicNumberValue = "\(total)"
        }
        
        updateView()
    }
    
}
