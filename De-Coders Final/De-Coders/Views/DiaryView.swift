//
//  FilledDiaryView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 17/11/21.
//

import SwiftUI

struct DiaryView: View {
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
                                    HStack {
                                        Text("\(diaryElement.name)")
                                        Spacer()
                                        Text(diaryElement.date)
                                    }
                                }
                            }
                            .onDelete(perform: delete)
                            
                        }
                        
                        
                    }
                    VStack {
                        Image("Diary")
                            .resizable()
                            .frame(width: 260, height: 260)
                        Text("Tap the plus button to add an expense")
                        .foregroundColor(.secondary)
                        
                    }
                    .opacity(diaryElement.diaryElements.count == 0 ? 1 : 0 )
                }
                .navigationTitle("Diary")
                .navigationBarItems( trailing: Button(action: {
                    showingSheetDiary.toggle()
                    
                }) { Image(systemName: "plus")
                        .font(Font.system(.headline))
                    
                })
                .sheet(isPresented: $showingSheetDiary){
                    AddExpenseView(opacity: $opacity, showingSheetDiary: $showingSheetDiary)
                }
                
            } //VStack
            .searchable(text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=$text@*/.constant("")/*@END_MENU_TOKEN@*/, placement: /*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            
        } //NavigationView
    } //Body
    
    //Per eliminare gli elementi dalla lista
    
  
        func delete(at offsets: IndexSet) {
            diaryElement.diaryElements.remove(atOffsets: offsets)
    }
}







struct FilledDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView().environmentObject(DiaryStore())
    }
}
