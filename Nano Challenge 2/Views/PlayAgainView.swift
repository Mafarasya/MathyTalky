//
//  PlayAgainView.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 25/05/23.
//

import SwiftUI

struct PlayAgainView: View {
    @Binding var score : Int
    
    var body: some View {
        ZStack {
            Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Game Over")
                    .font(.system(size: 40, weight: .bold))
                    .padding(1)

//                Spacer()
//                    .frame(height: 20)
                
                VStack {
                    Text("Best Score")
                        .font(.system(size: 25, weight: .medium))
                        .padding(.bottom, -15)

                    HStack {
                        Image("Trophy")
                            
                        Text("\(score)")
                            .foregroundColor(.black)
                            .font(.system(size: 40, weight: .bold))
                    }
                }
                .padding(.vertical, 40)

               
                
                NavigationLink(destination: LevelView()) {
                    Text("Play Again")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 210)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                        .background(Color("red"))
                        .cornerRadius(18)
                }
                .onTapGesture {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootViewController = windowScene.windows.first?.rootViewController {
                        rootViewController.dismiss(animated: true) {
                            if let navigationController = rootViewController.navigationController {
                                navigationController.popToRootViewController(animated: true)
                            }
                        }
                    }
                }
            }
            .padding(55)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color("EasyButton").opacity(0.4), lineWidth: 7)
            )
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white)
            )
        }
    }
}

struct PlayAgainView_Previews: PreviewProvider {
    static var previews: some View {
        PlayAgainView(score: .constant(0))
    }
}
