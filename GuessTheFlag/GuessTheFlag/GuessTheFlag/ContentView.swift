//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Александра Фонова on 30.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTirle = ""
    @State private var userScore = 0
    @State private var questionCounter = 1
    
    @State private var checkFlag = -1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    struct FlagImage: View {
        var countries: [String]
        var number: Int
                
        var body: some View {
                
            Image(countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }

    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.1), location: 0.3),
                .init(color: Color(red: 0.3, green: 0.2, blue: 0.2), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 30){
                    VStack{
                        Text("Tap the flg of")
                            .font(.subheadline.weight(.heavy))
//                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
//                            .foregroundColor(.white)
                    }
                    ForEach(0..<3) { number in
                            Button {
                                FlagTapped(number)
                            } label: {
                                FlagImage(countries: countries, number: number)
//                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                                    .rotation3DEffect(.degrees(checkFlag == number ? 360: 0), axis: (x: 0, y: 1, z: 0))
                                    .animation(.default, value: checkFlag)
                                }
                        }

                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
        }
        
        
        .alert(scoreTirle, isPresented: $showingScore) {
                    if questionCounter == 8 {
                        Button("Restart", action: restartGame)
                    } else {
                        Button("Continue", action: askQuestion)
                        
                    }
        } message: {
                    if questionCounter != 8 {
                        Text("Your score is \(userScore)")
                    } else if userScore <= 0 && questionCounter == 8 {
                        Text("You ended the game with a score of \(userScore). You can do better.")
                    } else if userScore > 0 && userScore <= 2 && questionCounter == 8  {
                        Text("You ended the game with a score of \(userScore). Not bad. Keep improving!")
                    } else if userScore > 2 && userScore <= 4 && questionCounter == 8 {
                        Text("You ended the game with a score of \(userScore). Pretty good!")
                    } else if userScore > 4 && userScore <= 6 && questionCounter == 8 {
                        Text("You ended the game with a score of \(userScore). Well done!")
                    } else if userScore > 6 && questionCounter == 8 {
                        Text("You ended the game with a score of \(userScore). You're a flag master!")
                    }
            }
    }
    func FlagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTirle = "Correct"
            userScore += 1
        } else {
            scoreTirle = "Wrong! That’s the flag of \(countries[number])"
            userScore -= 1
        }
        showingScore = true
        checkFlag = number
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter += 1
    }
    func restartGame() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            questionCounter = 1
            userScore = 0
    }
    func newQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            checkFlag = -1 // <------
            questionCounter+=1
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
