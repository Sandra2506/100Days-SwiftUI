//
//  ContentView.swift
//  Product_2
//
//  Created by Александра Фонова on 04.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appAnswers = ["Rock", "Paper", "Scissors"]
    @State private var appChoice = Int.random(in:0...2)
    @State private var mustWin = Bool.random()
    @State private var questionCounter = 1
    @State private var userScore = 0
    @State private var scoreAlert = ""
    @State private var showScore = false
    @State private var gameOver = false
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color.orange, location: 0.3),
                .init(color: Color(red: 0.6, green: 0.1, blue: 0.2), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 300)
            .ignoresSafeArea()
            VStack {
                Text("Brain Training")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
                    .frame(height: 100)
                Text("Question \(questionCounter) of 10")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                Spacer()
                Text("Score: \(userScore)")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
            }
            
            VStack {
                Spacer()
                Spacer()
                Text(mustWin ? "You must win!" : "You must lose!"  )
                    .font(.largeTitle.bold().smallCaps())
                    .foregroundColor(.orange)
                    .padding()
                
                Text("The computer chose: ")
                    .frame(height: 40)
                    .font(.title.bold().smallCaps())
                    .foregroundColor(.white)
                    
                Image("\(appAnswers[appChoice])")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Choose your move:")
                    .font(.title.bold().smallCaps())
                    .foregroundColor(.orange)
                
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            checkAnswer(number)
                        } label: {
                            Image("\(appAnswers[number])")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                Spacer()
            }
        }
        .alert(scoreAlert, isPresented: $showScore) {
            Button("Next question", action: newQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        
        .alert("Game finished!", isPresented: $gameOver) {
            Button("Restart game", action: restartGame)
        } message: {
            Text("You finished the game with a score of \(userScore).")
        }
    }
    
    func checkAnswer(_ userChoice: Int) {
        let requirementWinLose = mustWin ? "win" : "lose"
        let correctAnswerAlert = "Correct! You had to \(requirementWinLose). You chose \(appAnswers[userChoice]) and the computer chose \(appAnswers[appChoice])"
        let incorrectAnswerAlert = "Incorrect! You had to \(requirementWinLose). You chose \(appAnswers[userChoice]) and the computer chose \(appAnswers[appChoice])"
        
        if mustWin {
            if userChoice == 0 && appChoice == 0 || userChoice == 0 && appChoice == 1 {
                scoreAlert = incorrectAnswerAlert
                userScore-=1
            } else if userChoice == 0 && appChoice == 2 {
                scoreAlert = correctAnswerAlert
                userScore+=1
            } else if userChoice == 1 && appChoice == 1 || userChoice == 1 && appChoice == 2 {
                scoreAlert = incorrectAnswerAlert
                userScore-=1
            } else if userChoice == 1 && appChoice == 0 {
                scoreAlert = correctAnswerAlert
                userScore+=1
            } else if userChoice == 2 && appChoice == 0 || userChoice == 2 && appChoice == 2 {
                scoreAlert = incorrectAnswerAlert
                userScore-=1
            } else if userChoice == 2 && appChoice == 1 {
                scoreAlert = correctAnswerAlert
                userScore+=1
            }
        } else {
            if userChoice == 0 && appChoice == 0 || userChoice == 0 && appChoice == 2 {
                scoreAlert = incorrectAnswerAlert
                userScore-=1
            } else if userChoice == 0 && appChoice == 1 {
                scoreAlert = correctAnswerAlert
                userScore+=1
            } else if userChoice == 1 && appChoice == 0 || userChoice == 1 && appChoice == 1 {
                scoreAlert = incorrectAnswerAlert
                userScore-=1
            } else if userChoice == 1 && appChoice == 2 {
                scoreAlert = correctAnswerAlert
                userScore+=1
            } else if userChoice == 2 && appChoice == 1 || userChoice == 2 && appChoice == 2 {
                scoreAlert = incorrectAnswerAlert
                userScore-=1
            } else if userChoice == 2 && appChoice == 0 {
                scoreAlert = correctAnswerAlert
                userScore+=1
            }
        }
        
        showScore = true
        trackQuestions()
        
    }
    
    func trackQuestions() {
        if questionCounter == 10 {
            gameOver = true
            showScore = false
        }
    }
    
    func newQuestion() {
        appChoice = Int.random(in: 0...2)
        mustWin.toggle()
        questionCounter+=1
    }
    
    func restartGame() {
        appChoice = Int.random(in: 0...2)
        mustWin.toggle()
        userScore = 0
        questionCounter = 1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
