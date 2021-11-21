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
    
    @Published var subscriptions: [Subscription] = []
    
}


//Serve per la preview

var subscription1 = Subscription(category: "music", name: "Spotify", cost: 9.99, notes: "Lorem ipsum dolor sit amet. Sit voluptatem quos sit deleniti doloribus sed voluptatum omnis est quam maiores non tempore temporibus.", renewalDate: "")





