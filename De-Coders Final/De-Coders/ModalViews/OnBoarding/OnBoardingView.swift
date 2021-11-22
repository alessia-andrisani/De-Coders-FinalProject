//
//  OnBoardingView.swift
//  De-Coders
//
//  Created by Alessia Andrisani on 22/11/21.
//

import SwiftUI

struct OnBoardingView: View {
    @Binding var showingOnBoarding: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                Text("")
                    .navigationBarTitle(Text(""), displayMode: .inline)
                
                Text("Welcome on \n Mooney")
                    .font(.system(size: 38))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor(named:"AccentColor")!))
                    .multilineTextAlignment(.center)
                Spacer()
                
                
                HStack(alignment: .center){
                    Image("Subscriptions")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack{
                        Text("Subscriptions")
                            .font(.system(size: 18))
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, -140)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.")
                            .padding([.leading, .bottom, .trailing])
                            .font(.system(size: 18))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top)
                
                
                HStack(alignment: .center){
                    Image("Diary")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack{
                        Text("Diary")
                            .font(.system(size: 18))
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, -140)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.")
                            .padding([.leading, .bottom, .trailing])
                            .font(.system(size: 18))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top)
                
                HStack(alignment: .center){
                    Image("Summary")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack{
                        Text("Summary")
                            .font(.system(size: 18))
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, -140)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.")
                            .padding([.leading, .bottom, .trailing])
                            .font(.system(size: 18))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical)
                Spacer()
                
                Button(action: {
                    showingOnBoarding = false
                    
                }) {
                    ZStack{
                        Rectangle()
                            .frame(width: 315, height: 55)
                            .cornerRadius(15)
                            .foregroundColor(Color(UIColor(named:"AccentColor")!))
                        Text("Continue")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                      
                    }
                    
                    
                }
                .padding(.bottom, 70)
                
            }
            
        } .padding(.all)
    }
}























struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}
