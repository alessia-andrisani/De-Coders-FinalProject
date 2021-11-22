//
//  FilledSubscriptionsView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import SwiftUI

struct SubscriptionsView: View {
    
    @State private var showingOnBoarding: Bool = true
    
    
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
                                        HStack {
                                            Text("\(subscription.name)")
                                            Spacer()
                                            Text("\(subscription.renewalDate)").bold()
                                        }
                                    }
                                }
                            }
                        }
                        //                header: {
                        //
                        //                    Text("Music").foregroundColor(.black).bold()
                        //
                        //                }
                        
                        
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
        .sheet(isPresented: $showingOnBoarding) {
            OnBoardingView(showingOnBoarding: $showingOnBoarding)
        }
    }
    
}






struct FilledSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView().environmentObject(SubscriptionStore())
    }
}
