//
//  ContentView.swift
//  AP CSP
//
//  Created by Abe on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    
    func evaluateChoice(country: String) {
        
        if rounds < 4 {
            if country == gameCountries[gameAnswer] {
                points += 1 // Add one point
                showCorrectAlert = true // Show the correct alert
            } else {
                showWrongAlert = true // Show the incorrect alert
            }
        } else {
            showEndAlert = true // End the game if rounds exceed 10
        }
        
        rounds += 1 // Add another round
    }
    
    func nextGameRound() {
        gameCountries.shuffle()
        gameAnswer = Int.random(in: 0...3)
        changeSentence = false
    }
    
    func resetGame() {
        gameCountries.shuffle()
        gameAnswer = Int.random(in: 0...3)
        points = 0
        rounds = 0
        changeSentence = false
    }
    
    @State private var gameCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    @State private var gameAnswer = Int.random(in: 0...3)
    
    @State private var changeSentence = false
    
    @State private var index: Int = 0
    
    @State private var points: Int = 0
    
    @State private var rounds: Int = 1
    
    @State private var showCorrectAlert: Bool = false
    
    @State private var showWrongAlert: Bool = false
    
    @State private var showEndAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("Guess The Country!")
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .shadow(radius: 1, y: 2)
            
            Spacer()

            VStack {
                VStack {
                    Text("Round \(rounds)")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(35)
                        .shadow(radius: 1)
                }
                
                VStack {
                    Image(gameCountries[gameAnswer])
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 1, x: 5, y: 5)
                        .shadow(radius: 1)
                        .padding(.vertical)
                    
                    if !changeSentence {
                        Text("This country is ________.")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.semibold)
                            .padding()
                        
                    } else {
                        Text("This country is \(gameCountries[index]).")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.semibold)
                            .padding()
                    }
                }
              
                Spacer()
                
                VStack(spacing: 15) {
                    Button {
                        index = 0
                        changeSentence = true
                        evaluateChoice(country: gameCountries[0])
                    } label: {
                        Text("\(gameCountries[0])")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 150)
                            .padding()
                            .background(.blue)
                            .cornerRadius(30)
                            .shadow(radius: 1)
                    }
                    
                    Button {
                        index = 1
                        changeSentence = true
                        evaluateChoice(country: gameCountries[1])
                    } label: {
                        Text("\(gameCountries[1])")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 150)
                            .padding()
                            .background(.blue)
                            .cornerRadius(30)
                            .shadow(radius: 1)
                    }
                    
                    Button {
                        index = 2
                        changeSentence = true
                        evaluateChoice(country: gameCountries[2])
                    } label: {
                        Text("\(gameCountries[2])")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 150)
                            .padding()
                            .background(.blue)
                            .cornerRadius(30)
                            .shadow(radius: 1)
                    }
                    
                    Button {
                        index = 3
                        changeSentence = true
                        evaluateChoice(country: gameCountries[3])
                    } label: {
                        Text("\(gameCountries[3])")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 150)
                            .padding()
                            .background(.blue)
                            .cornerRadius(30)
                            .shadow(radius: 1)
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 1, x: 5, y: 5)
                .shadow(radius: 2)
                
                Spacer()
                
            }
            .padding()
        }
        .background(Color("background"))
        .alert("Correct!", isPresented: $showCorrectAlert) {
            Button("Next Question", action: nextGameRound)
        } message: {
            Text("You have \(points) points now")
        }
        .alert("Incorrect!", isPresented: $showWrongAlert) {
            Button("Next Question", action: nextGameRound)
        } message: {
            Text("You still have \(points) points")
        }
        .alert("Thank you for playing", isPresented: $showEndAlert) {
            Button("Reset", action: resetGame)
        } message: {
            Text("You earned \(points) points")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
