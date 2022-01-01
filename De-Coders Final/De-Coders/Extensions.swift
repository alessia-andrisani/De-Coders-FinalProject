//
//  Extensions.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 01/01/22.
//

import Foundation
import SwiftUI

//Extension per formattare in stringa, formato currency, il costo della subscription e del diary

extension Double {
    
    var doubleInCurrencyString: String {
        
        let doubleFormatter = NumberFormatter()
        doubleFormatter.locale = Locale.current
        doubleFormatter.numberStyle = .currency
        return doubleFormatter.string(from: self as NSNumber) ?? ""
        
    }
 
}

