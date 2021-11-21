//
//  DiaryDetailsView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import SwiftUI

struct DiaryDetailsView: View {
    
    var diaryElement: DiaryElement
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    HStack {
                        Text("Date")
                        Spacer()
                        Text(diaryElement.date)
                        
                        
                    }
                    
                    
                    HStack {
                        Text("Price")
                        Spacer()
                        
                        Text(diaryElement.cost.doubleInCurrencyString)
                    
                    }
                    
                    HStack {
                    Text("Notes")
                        Spacer()
                        Text(diaryElement.notes)
                    }
                }
            header: {
                
                Text("Details").foregroundColor(.black).bold()
                
                
               }
                
            }   //Form
            
            
        }   //NavigationView
        
        .navigationBarTitle(diaryElement.name, displayMode: .inline)
        .navigationBarItems(trailing: Button("Edit") {
            print("Azione Bottone")  //Inserire Azione bottone
            
        })
        
        
    }
}

struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailsView(diaryElement: diaryElement1)
    }
}
