//
//  Diary.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import Foundation
import SwiftUI

struct DiaryElement: Identifiable, Codable {
    var id = UUID()
    var name: String
    var cost: Double
    var notes: String
    var date: String
   
}



