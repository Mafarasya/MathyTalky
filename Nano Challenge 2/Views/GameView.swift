//
//  GameView.swift
//  Nano Challenge 2
//
//  Created by Mahatmaditya FRS on 23/05/23.
//

import SwiftUI

struct GameView: View {
    
    @State private var textColor: Color = .white
    @State private var firstNum = 0
    @State private var secondNum = 0
    @State private var calculateResult = 0
    @State private var isAnswerCorrect = true
    @State var score = 0
    @State private var speechTranscript: String = ""
    @State private var lives = 3 // Jumlah nyawa
    @State private var isGameOver = false

    
    
    @StateObject var speechRecognizer = SpeechRecognizer()
    // You’ll use this variable in the next section to display recording indicators
    @State private var isRecording = false
    
    enum Level {
        case easy
        case medium
        case hard
    }
    
    //    var selectedLevel: Level
    
    
    @State private var level: Level = .easy
    @State private var isAnswerGiven = false
    
    var body: some View {
        
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            //            HStack {
            //                Spacer()
            //                HStack {
            //                    Image("Clock")
            //                    Text("Timer")
            //                        .font(.system(size: 25, weight: .semibold))
            //
            //                }
            //                .padding()
            //                .background()
            //                .cornerRadius(40)
            //
            //            }
            
            VStack(alignment: .center) {
                //                Spacer()
                VStack {
                    // Score
                    HStack {
                        HStack {
                            ForEach(0..<lives, id: \.self) { _ in
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.red)
                            }
                        }
                        Spacer()
                        HStack {
                            Image("Trophy")
                            
                            
                            Text("\(score)")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                        }
                        .padding(10)
                        .background(Color("MediumButton"))
                        .cornerRadius(40)
                    }
                    .padding(5)
                    
                    VStack {
                        Text("Determine")
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("This Equation")
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("\(firstNum) + \(secondNum) = \(calculateResult)")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 220)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                        .background(Color("MediumButton"))
                        .cornerRadius(18)
                
                    if isGameOver {
                        NavigationLink(destination: PlayAgainView(score: $score), isActive: $isGameOver, label: { EmptyView()}
                        )
                        .navigationBarHidden(true)
                    }
                                       
                    
                    //                    HStack {
                    //                        Button(action: {
                    //                            checkAnswer(userAnswer: true)
                    //                        }) {
                    //                            Text("True")
                    //                                .padding()
                    //                                .background(Color.green)
                    //                                .foregroundColor(.white)
                    //                                .cornerRadius(10)
                    //                        }
                    //
                    //                        Button(action: {
                    //                            checkAnswer(userAnswer: false)
                    //                        }) {
                    //                            Text("False")
                    //                                .padding()
                    //                                .background(Color.red)
                    //                                .foregroundColor(.white)
                    //                                .cornerRadius(10)
                    //                        }
                    //                    }
                    //                    .padding()
                    //
                    //                if String(speechRecognizer.transcript) == "Yes" {
                    //                    checkAnswer(userAnswer: true)
                    //                }
                    //                else if String(speechRecognizer.transcript) == "No" {
                    //                    checkAnswer(userAnswer: false)
                    //                }
                    
                    Text("Tap to speak")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                        .padding(.top, 50)
                    Text("YES / NO")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                        .tracking(2)
                    
                    //                HStack {
                    //                    Text("True")
                    //                    //                        .foregroundColor(.black)
                    //                        .font(.system(size: 25, weight: .semibold))
                    //                        .tracking(2)
                    //
                    //                    Text("or")
                    //                        .font(.system(size: 25, weight: .semibold))
                    //                    //                        .foregroundColor(.white)
                    //                        .tracking(2)
                    //
                    //                    Text("False")
                    //                    //.foregroundColor(String(speechRecognizer.transcript) == "No" ? .red : .white)
                    //                        .font(.system(size: 25, weight: .semibold))
                    //                        .tracking(2)
                    //                }
                    
                    
                    //                    Spacer()
                    Button(action: {
                        if !isRecording {
                            speechRecognizer.startTranscribing()
                            
                        } else {
                            speechRecognizer.stopTranscribing()
                            
                            let transcript = String(speechRecognizer.transcript).lowercased()
                            
                            if transcript == "yes" {
                                checkAnswer(userAnswer: true)
                            } else if transcript == "no" {
                                checkAnswer(userAnswer: false)
                            }
                            
                            
                        }
                        
                        //                        if String(speechRecognizer.transcript).lowercased() == "yes" {
                        //                            checkAnswer(userAnswer: true)
                        //                            //                                generateNewQuestion()
                        //
                        //                        } else if String(speechRecognizer.transcript).lowercased() == "no" {
                        //                            checkAnswer(userAnswer: false)
                        //                            //                                generateNewQuestion()
                        //                        }
                        
                        isRecording.toggle()
                        
                    }) {
                        Image(isRecording ? "MicOff" : "MicOn")
                    }
                    
                    
                }
                //                .padding(10)
                //                .frame(width: 360, height: 550)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color("EasyButton").opacity(0.4), lineWidth: 7)
                )
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.white)
                    
                )
                //                Spacer()
                
                
            }
            .padding(20)
            .onAppear {
                generateNewQuestion()
            }
            
        }
    }
    
    func generateNewQuestion() {
        firstNum = Int.random(in: 0...10)
        secondNum = Int.random(in: 0...10)
        isAnswerCorrect = Bool.random()
        print(speechRecognizer.transcript)
        if isAnswerCorrect {
            calculateResult = firstNum + secondNum
        } else {
            // Menghasilkan jawaban yang salah dengan menambahkan angka acak ke hasil
            // generate angka acak dari 1 - 19
            var randomIncorrectCalculateResult = Int.random(in: 1...19)
            
            // memastikan bahwa jawaban yang salah yang dihasilkan secara acak tidak sama dengan perhitungan yang benar
            while randomIncorrectCalculateResult == calculateResult {
                randomIncorrectCalculateResult = Int.random(in: 1...19)
            }
            calculateResult = randomIncorrectCalculateResult
        }
    }
    
    func checkAnswer(userAnswer: Bool) {
        
        
        let correctAnswer = firstNum + secondNum
        
        if (correctAnswer == calculateResult && userAnswer == true) || (correctAnswer != calculateResult && userAnswer == false) {
             score += 1
        } else {
                score -= 1
                lives -= 1
                
                if lives == 0 {
                        isGameOver = true // Set isGameOver to true when lives are depleted
                    }
        }
        
        //        if (correctAnswer == calculateResult && userAnswer == true) || (correctAnswer != calculateResult && userAnswer == false) {
        //                score += 1
        //            } else {
        //                score -= 1
        //            }
        
        generateNewQuestion()
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
