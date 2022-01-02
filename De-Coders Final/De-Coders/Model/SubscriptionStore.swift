//
//  SubscriptionStore.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import Foundation
import SwiftUI

//Classe che contiene l'array delle subscriptions

class SubscriptionStore: ObservableObject {
    
    @Published var subscriptions: [Subscription] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(subscriptions) {
                UserDefaults.standard.set(encoded, forKey: "Subscriptions")
            }
            
        }
    }
    
    init() {
        if let savedSubscriptions = UserDefaults.standard.data(forKey: "Subscriptions") {
            if let decodedSubscriptions = try? JSONDecoder().decode([Subscription].self, from: savedSubscriptions) {
                subscriptions = decodedSubscriptions
                return
            }
        }
        subscriptions = []
    }
    
}


//Serve per la preview

var subscription1 = Subscription(category: "music", name: "Spotify", cost: 9.99, notes: "Lorem ipsum dolor sit amet. Sit voluptatem quos sit deleniti doloribus sed voluptatum omnis est quam maiores non tempore temporibus.", renewalDate: "")





