//
//  HowToPlayPopupView.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 24/05/23.
//

import SwiftUI

struct HowToPlayPopupView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                    .onTapGesture {
                        isPresented = false
                    }
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("How to Play")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("1.) Perhatikan perhitungan matematika. Apakah benar atau salah?")
                        Text("2.) Amati apakah pernyataan tersebut benar atau salah")
                        Text("3.) Lalu, Tekan tombol microphone untuk menjawab")
                        Text("4.) Ucapkan yes untuk true dan no untuk false.")
                    }
                    .font(.system(size: 18, weight: .medium))
                    .padding(.horizontal, 30)
                    
                    
                    Button("Got It!") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 60)
                    .padding(10)
                    .background(Color("PlayButton"))
                    .cornerRadius(18)
                    .padding()
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.6)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
    }
}


struct HowToPlayPopupView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayPopupView(isPresented: .constant(true))
    }
}
