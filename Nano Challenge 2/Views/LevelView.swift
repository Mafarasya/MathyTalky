//
//  LevelView.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 23/05/23.
//

import SwiftUI

struct LevelView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedLevel: GameView.Level?

    var body: some View {
        ZStack {
            Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Choose Level")
                    .font(.system(size: 30, weight: .bold))

                Spacer()
                    .frame(height: 20)
                
                VStack {
                    NavigationLink(destination: GameView()) {
                        Text("Easy")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 210)
                            .padding(.horizontal)
                            .padding(.vertical, 20)
                            .background(Color("red"))
                            .cornerRadius(18)
                    }

                    Spacer()
                        .frame(height: 20)

                    NavigationLink(destination: GameView()) {
                        Text("Medium")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 210)
                            .padding(.horizontal)
                            .padding(.vertical, 20)
                            .background(Color("MediumButton"))
                            .cornerRadius(18)
                    }

                    Spacer()
                        .frame(height: 20)

                    NavigationLink(destination: GameView()) {
                        Text("Hard")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 210)
                            .padding(.horizontal)
                            .padding(.vertical, 20)
                            .background(Color("HardButton"))
                            .cornerRadius(18)
                    }
                }
            }
            .padding(50)
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

extension UINavigationController {

  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }

}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
