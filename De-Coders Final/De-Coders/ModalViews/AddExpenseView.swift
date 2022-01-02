//
//  AddExpenseView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 16/11/21.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Binding var opacity : Double
    
    @EnvironmentObject var diaryElement: DiaryStore
    
    @Binding var showingSheetDiary: Bool
    @Environment(\.dismiss) var dismiss
    @State private var diaryName = ""
    @State private var diaryCost: Double = 0
    @State private var diaryNotes = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    Section {
                        TextField("Name",text: $diaryName)
                        TextField("Cost", value: $diaryCost, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                            .keyboardType(.decimalPad)
                        
                        TextField("Notes", text: $diaryNotes)
                        
                    }
                header: {
                    
                    Text("Details").foregroundColor(.black).bold()
                    
                    
                }
                    
                    Section {
                        
                        DatePicker("Date", selection: $date,  displayedComponents: .date)
                        
                    }
                    
                    
                }
                .navigationBarTitle(Text("New Expense"), displayMode: .inline)
                .navigationBarItems(leading: Button { self.showingSheetDiary = false
                } label: {
                    Text("Cancel").bold()
                })
                
                .navigationBarItems(trailing: Button { self.showingSheetDiary = false
                   
                    
                    //Formattare la data come stringa (si adatta al locale dell'utente)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .short
                    let newDate = dateFormatter.string(from: date)
                    
                    
                    
                    //Elemento che si crea quando l'utente clicca done
                    let elementoDaInserire: DiaryElement = DiaryElement(name: diaryName , cost: diaryCost, notes: diaryNotes, date: newDate)
                    //Aggiunge l'elemento da inserire all'array diaryElements
                    diaryElement.diaryElements.append(elementoDaInserire)
                       
                   
                } label: {
                    Text("Done").bold()
                })
                
                
                
            }
        }
    }
}






















struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView().environmentObject(DiaryStore())
    }
}


