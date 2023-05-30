//
//  HowToPlayModal.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 24/05/23.
//

import SwiftUI

struct HowToPlayModal: View {
    @State private var showHowToPlayPopup = false
    
    var body: some View {
        VStack {
            Text("Game Screen")
                .font(.title)
                .padding()
            
            // Konten permainan matematika True or False di sini
            
            Button("How to Play") {
                showHowToPlayPopup = true
            }
            .padding()
            // sheet popup
            .sheet(isPresented: $showHowToPlayPopup) {
                HowToPlayPopupView(isPresented: $showHowToPlayPopup)
            }
        }
    }
}

struct HowToPlayModal_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayModal()
    }
}
