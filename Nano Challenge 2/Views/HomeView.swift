//
//  HomeView.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 23/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showLevelView = false
    @State private var showHowToPlayPopup = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
//                        .frame(height: 220)
                    Image("memoji")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170)
                        .padding()
                    Image("MathyTalkyLogo")
                        .resizable()
                        .scaledToFit()
//                        .background(
//                            Rectangle()
//                                .fill(Color.white)
////                                .blur(radius: 40)
//                                .frame(width: .infinity)
//                                .cornerRadius(18)
//                        )
                        .padding(.horizontal, 30)
                    
                    Image("voices")
                        .padding(23)
                    
                    
                    NavigationLink (destination: LevelView()) {
                        Text("Play")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 210)
                            .padding(.horizontal)
                            .padding(.vertical, 20)
                            .background(Color("red"))
                            .cornerRadius(18)
                    }
                    .padding()
                    
                    Spacer()

                    HStack() {
                        Spacer()
                        Button(action: {
                                // Action for the small button
                                showHowToPlayPopup = true

                            }) {
                                Image("HowToPlay")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding(10)
                            }
                            //                                    .offset(x: 170, y: 240)
                            .sheet(isPresented: $showHowToPlayPopup) {
                                HowToPlayPopupView(isPresented: $showHowToPlayPopup)
                        }
                    }
                    Spacer()
                        .frame(height: 25)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
