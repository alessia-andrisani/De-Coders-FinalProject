//
//  DiaryStore.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import Foundation
import SwiftUI

class DiaryStore: ObservableObject {
    
    @Published var diaryElements: [DiaryElement] = []
    
    
}


// Serve per la preview

var diaryElement1 = DiaryElement(name: "Hairdresser", cost: 20, notes: "Highlights and cut", date: "")



