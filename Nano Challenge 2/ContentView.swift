//
//  ContentView.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showLevelView = false
    @State private var showHowToPlayPopup = false

    
    var body: some View {
        HomeView()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
