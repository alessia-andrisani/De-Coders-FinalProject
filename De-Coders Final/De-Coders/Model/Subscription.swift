//
//  Subscription.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import Foundation
import SwiftUI


struct Subscription: Identifiable, Codable {
    
    var id = UUID()
    var category: String
    var name: String
    var cost: Double
    var notes: String
    var renewalDate: String
        
}






