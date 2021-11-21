//
//  FilledSubscriptionsView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import SwiftUI

struct FilledSubscriptionsView: View {
    
    @State private var opacity: Double = 1 
    
    @State private var showingSheet: Bool = false
    
    @EnvironmentObject var subscription: SubscriptionStore
    

    
    var body: some View {
        
        NavigationView {
            
            VStack {

                
                
                ZStack {
                Form {
                    
                    Section {
                        
                        List {
                            ForEach(subscription.subscriptions) { subscription in
                                
                                NavigationLink(destination: SubscriptionDetailsView(subscription: subscription)) {
                                   
                                    Text("\(subscription.name)")
                                 
                                }
                            }
                        }
                    }
                header: {
                    
                    Text("Music").foregroundColor(.black).bold()
     
                }
                    
            
            } //Form
                    
                    
                    Text("Tap the plus button to add a subscription")
                       
                        .foregroundColor(.secondary).opacity(opacity)  
                        
                }
                
               
                
                .navigationTitle("Subscriptions")
                .navigationBarItems( trailing: Button(action: {
                    showingSheet.toggle()
                    
                })
                                     { Image(systemName: "plus")
                        .font(Font.system(.title))
                    
                }) .sheet(isPresented: $showingSheet) {
                    AddSubscriptionView(showingSheet: $showingSheet, opacity: $opacity)
                    
                }
               
                
                
                
            } //VStack
            
            .searchable(text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            
        } //NavigationView
    }
    
}






struct FilledSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        FilledSubscriptionsView().environmentObject(SubscriptionStore())
    }
}
