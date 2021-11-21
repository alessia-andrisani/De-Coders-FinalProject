//
//  Subscription.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import Foundation
import SwiftUI


struct Subscription: Identifiable {
    
    let id = UUID()
    var category: String
    var name: String
    var cost: Double
    var notes: String
    var renewalDate: String
        
}


//Extension per formattare in stringa, formato currency, il costo della subscription e del diary

extension Double {
    
    var doubleInCurrencyString: String {
        
        let doubleFormatter = NumberFormatter()
        doubleFormatter.locale = Locale.current
        doubleFormatter.numberStyle = .currency
        return doubleFormatter.string(from: self as NSNumber) ?? ""
        
    }
 
}




