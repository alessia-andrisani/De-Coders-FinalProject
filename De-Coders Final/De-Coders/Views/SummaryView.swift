//
//  SummaryView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 15/11/21.
//

import SwiftUI

struct SummaryView: View {
    
    @EnvironmentObject var subscription: SubscriptionStore
    @EnvironmentObject var diaryElement: DiaryStore
    
    //Somma Subscriptions
    
    var sommaSub: Double {
        var risultatoSub: Double = 0
        for subscription in subscription.subscriptions {
            risultatoSub += subscription.cost
            
        }
        
        return risultatoSub
    }
    
    //Somma Diary
    
    var sommaDiary: Double {
        
        var risultatoDiary: Double = 0
        for diaryElement in diaryElement.diaryElements {
            
            risultatoDiary += diaryElement.cost
            
        }
        
        return risultatoDiary
        
    }
    
    var sommaTotale: Double {
        return  sommaSub + sommaDiary
        
    }
    
    @State private var referenceFrame: String = "Weekly"
    let timeframes = ["Weekly","Monthly"]
    
    var body: some View {
        
        NavigationView {
            
            
            Form {
                Section {
                    Picker("Select time frame", selection: $referenceFrame) {
                        ForEach (timeframes, id: \.self) {
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    ForEach (subscription.subscriptions) {
                        subscription in
                        HStack {
                            Text("\(subscription.name)")
                            Spacer()
                            Text(subscription.cost.doubleInCurrencyString)
                            
                        }
                    }
                    ForEach (diaryElement.diaryElements) {
                        diaryElement in
                        HStack {
                            Text("\(diaryElement.name)")
                            Spacer()
                            Text(diaryElement.cost.doubleInCurrencyString)
                            
                        }
                    }
                }
                
                Section {
                    
                    Text(sommaTotale.doubleInCurrencyString)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    
                    
                    
                    
                    
                } header: {
                    Text("Total Expenses")
                        .font(.subheadline).fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    
                }
                
                
                
            } //Form
            .navigationBarTitle("Summary")
            
            
        } //NavigationView
        
        
    } //Body
    
} //SummaryView
























struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView().environmentObject(SubscriptionStore()).environmentObject(DiaryStore())
    }
}
