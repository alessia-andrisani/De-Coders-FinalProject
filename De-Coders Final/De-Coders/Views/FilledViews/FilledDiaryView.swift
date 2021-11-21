//
//  FilledDiaryView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import SwiftUI

struct FilledDiaryView: View {
    @State private var showingSheetDiary: Bool = false
    @EnvironmentObject var diaryElement: DiaryStore
    
    @State private var opacity: Double = 1
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                ZStack {
                    
                    Form {
                        List {
                            ForEach(diaryElement.diaryElements) { diaryElement in
                                
                                NavigationLink(destination: DiaryDetailsView(diaryElement: diaryElement)) {
                                    Text("\(diaryElement.name)")
                                    
                                }
                            }
                            
                        }
                        
                        
                    }
                    Text("Tap the plus button to add an expense")
                        .foregroundColor(.secondary)
                        .opacity(opacity)
                }
                .navigationTitle("Diary")
                .navigationBarItems( trailing: Button(action: {
                    showingSheetDiary.toggle()
                    
                }) { Image(systemName: "plus")
                        .font(Font.system(.title))
                    
                })
                .sheet(isPresented: $showingSheetDiary){
                    AddExpenseView(opacity: $opacity, showingSheetDiary: $showingSheetDiary)
                }
                
            } //VStack
            .searchable(text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            
        } //NavigationView
    } //Body
}







struct FilledDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        FilledDiaryView().environmentObject(DiaryStore())
    }
}
