//
//  DiaryStore.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import Foundation
import SwiftUI

class DiaryStore: ObservableObject {
    
    @Published var diaryElements: [DiaryElement] = [] {
        didSet {
            
            if let encoded = try? JSONEncoder().encode(diaryElements) {
                UserDefaults.standard.set(encoded, forKey: "DiaryElements")
            }
        }
    }
    init() {
        if let savedDiryElements = UserDefaults.standard.data(forKey: "DiaryElements") {
            if let decodedDiaryElements = try? JSONDecoder().decode([DiaryElement].self, from: savedDiryElements) {
                diaryElements = decodedDiaryElements
            }
        }
        diaryElements = []
    }
    
}


// Serve per la preview

var diaryElement1 = DiaryElement(name: "Hairdresser", cost: 20, notes: "Highlights and cut", date: "")



