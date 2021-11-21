//
//  SubscriptionDetailsView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import SwiftUI

struct SubscriptionDetailsView: View {
    
    var subscription: Subscription
   
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    HStack {
                    Text("Date of renewal")
                        Spacer()
                        Text("\(subscription.renewalDate)").foregroundColor(.secondary)
                    
                    }
                    HStack {
                    Text(String(format: "%.2f", ceil( subscription.cost * 10) / 10.0))
                        Text("€")
                    }
                    
                    Text(subscription.notes)
             
            }
                
            header: {
                
                Text("Details").foregroundColor(.black).bold()
                
                
            }
                
                
    }
            
            
           
            
            
        }
        .navigationBarTitle(subscription.name, displayMode: .inline)
        .navigationBarItems(trailing: Button("Edit") {
            print("Azione Bottone")  //Inserire Azione bottone
            
        })

    }
}










struct SubscriptionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionDetailsView(subscription: subscription1)
    }
}
