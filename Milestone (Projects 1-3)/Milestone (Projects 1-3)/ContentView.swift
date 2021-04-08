//
//  ContentView.swift
//  Milestone (Projects 1-3)
//
//  Created by Pedro Neto on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    var possibleMoves = ["Rock 🪨", "Paper 📃", "Scissors ✂"]

    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var appsMove = Int.random(in: 0..<3)
    @State private var showingResult = false
    @State private var alertTitle = ""

    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.gray, .blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(){
                Text("Milestone: Projects 1-3")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(.bottom)
                
                VStack {
                    HStack {
                        Text("Score:")
                            .italic()
                        Text("\(score)")
                            .bold()
                    }
                    HStack {
                        Text("We went: ")
                            .italic()
                        Text("\(possibleMoves[appsMove])")
                            .bold()
                    }
                    HStack{
                        Text("You should:")
                            .italic()
                        Text(" \(shouldWin ? "win" : "lose")")
                            .bold()
                    }
                }
                .foregroundColor(.white)
                .font(.title)
                
                VStack {
                    ForEach(0..<possibleMoves.count) { number in
                        Button(action: {
                            self.btbTapped(number)
                        }) {
                            Text("  \(possibleMoves[number])  ")
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                .shadow(color: .black, radius: 2)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .padding()
                        }
                    }
                }
            }
        }
        .alert(isPresented: $showingResult) {
            Alert(title: Text(alertTitle), message: nil, dismissButton: .default(Text("Continue")){
                
            })
        }
    }
    
    func btbTapped(_ number: Int) {
        var answer: Bool
        
        if number == 2 && appsMove == 0 {
            answer = false
            
        } else if (number == 0 && appsMove == 2) || (number > appsMove)  {
            answer = true
            
        } else {
            answer = false
        }
        
        if !shouldWin && number != appsMove { answer.toggle() }
        getAnswer(answer)
    }
    
    func getAnswer(_ answer: Bool)  {
        
        if answer {
            if score+1 == 10 {
                alertTitle = "You Won"
                score = 0
            } else {
                alertTitle = "Correct!"
                score += 1
            }
        } else {
            alertTitle = "That's not Correct."
            if score > 0 { score -= 1 }
        }
        
        showingResult = true
        shouldWin = Bool.random()
        appsMove = Int.random(in: 0..<3)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//        }
//    }
//}
