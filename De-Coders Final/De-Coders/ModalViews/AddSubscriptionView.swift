//
//  SwiftUIView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 16/11/21.
//

import SwiftUI

struct AddSubscriptionView: View {
    
    @EnvironmentObject var subscription: SubscriptionStore
    @Binding var showingSheet: Bool
    @State private var choosenCategory = ""
    @State private var subscriptionName = ""
    @State private var subscriptionCost: Double = 0
    @State private var subscriptionNotes = ""
    @State private var renewalDate = Date()
    
    
    @Binding var opacity: Double
    
    var categories = ["None","Music", "Video", "Games", "Shopping", "House", "Car"]
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Form {
                    Section {
                        Picker("Choose category", selection: $choosenCategory) {
                            
                            ForEach (categories, id: \.self) {
                                
                                Text($0)
                            }
                            
                        } .pickerStyle(.menu)
                        
                    }
                header: {
                    
                    Text("Category").foregroundColor(.black).bold()
                }
                    
                    Section {
                        TextField("Name", text: $subscriptionName)
                        
                        TextField("Cost", value: $subscriptionCost, format: .currency(code: Locale.current.currencyCode ?? "EUR")).keyboardType(.decimalPad)
                        
                        TextField("Notes", text: $subscriptionNotes)
                        
                    }
                header: {
                    
                    Text("Details").foregroundColor(.black).bold()
                    
                    
                }
                    
                    Section {
                        
                        DatePicker("Date of renewal", selection: $renewalDate,  displayedComponents: .date)
                        
                        
                    }
                    
                    
                } //Form
                
                .navigationBarTitle(Text("New Subscription"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showingSheet = false
                    
                    
                    //Formattare la data come stringa (si adatta al locale dell'utente)
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .short
                    let newDate = dateFormatter.string(from: renewalDate)
                    
                    //Chiamo funzione per formattare currency in String
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                        
                    //Ha creato una subscription vuota in cui si aggiungono i dati che inserisce l'utente
                    
                    let subDaInserire: Subscription = Subscription(category: choosenCategory, name: subscriptionName, cost: subscriptionCost, notes: subscriptionNotes, renewalDate: newDate)
                    
                    //Aggiunge l'elemento dell'utente all'array subscriptions
                    subscription.subscriptions.append(subDaInserire)
                    
                    //Fa scomparire testo tap sul plus...
                    opacity = 0
                }) {
                    Text("Done").bold()
                    
                })
                .navigationBarItems(leading: Button(action: {
                    self.showingSheet = false
                }) {
                    Text("Cancel").bold()
                    
                })
                
            } //VStack
            
        }  //NavigationView
        
    } //Body
    
} //ContentView


























struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView().environmentObject(SubscriptionStore())
    }
}
