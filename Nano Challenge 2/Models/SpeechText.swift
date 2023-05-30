//
//  SpeechText.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 24/05/23.
//

import Foundation

struct SpeechText: Codable {
    var transcript: String?
    
    init(transcript: String? = nil) {
        self.transcript = transcript
    }
}
