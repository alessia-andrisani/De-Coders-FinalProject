//
//  De_CodersApp.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 15/11/21.
//

import SwiftUI

@main    //Property Wrapper - Search documentation
struct De_CodersApp: App {
    
    @StateObject var subscription = SubscriptionStore()
    @StateObject var diaryElement = DiaryStore()
    //Per registrare la tab selezionata
    @State private var selectedTab = "Subscriptions"
    

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                SubscriptionsView().environmentObject(subscription).tabItem {
                    Image(systemName: "list.bullet")
                    Text("Subscriptions") } .tag("Subscriptions")
                DiaryView().environmentObject(diaryElement).tabItem {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text("Diary") } .tag("Diary")
                SummaryView().environmentObject(subscription).environmentObject(diaryElement).tabItem {
                    Image(systemName: "cart")
                   Text("Summary") } .tag("Summary")
            }
        }
    }
}
