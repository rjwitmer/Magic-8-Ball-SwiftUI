//
//  ContentView.swift
//  Magic-8-Ball-SwiftUI
//
//  Created by Bob Witmer on 2023-07-17.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = Image("8-ball")
    @State private var animateImage = false
    @State private var playAgainHidden = true
    @State private var messageAnswer = ""
    @State private var previousAnswer = ""
    @State private var answersArray = ["It is certain.",
                                       "As I see it, yes.",
                                       "Reply hazy, try again.",
                                       "Don't count on it.",
                                       "It is decidedly so.",
                                       "Most likely.",
                                       "Ask again later.",
                                       "My reply is no.",
                                       "Without a doubt.",
                                       "Outlook good.",
                                       "Better not tell you now.",
                                       "My sources say no.",
                                       "Yes definitely.",
                                       "Yes.",
                                       "Can not predict now.",
                                       "Outlook not so good.",
                                       "You may rely on it.",
                                       "Signs point to yes.",
                                       "Concentrate and ask again.",
                                       "Very doubtful."]
    
    
    var body: some View {
        VStack {
            
                imageName
                    .resizable()
                    .scaledToFit()
                    .animation(.easeIn(duration: 0.75), value: imageName)
                
                Text(messageAnswer)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.blue)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.blue, lineWidth: 2)
                    }
            
            Spacer()
            
            Button("Ask a Question") {
                repeat {
                    if !answersArray.isEmpty {
                        messageAnswer = answersArray.randomElement()!
                        imageName = Image("8-ball-blue")
                        animateImage = true
                        playAgainHidden = false
                    } else {
                        messageAnswer = "😡 Error: No answers in my array."
                    }
                } while messageAnswer == previousAnswer
                previousAnswer = messageAnswer
            }
            .buttonStyle(.borderedProminent)
            .font(.largeTitle)
 
            Spacer()
            
            if !playAgainHidden {
                Button("Reset") {
                    imageName = Image("8-ball")
                    messageAnswer = ""
                    playAgainHidden = true
                }
                .font(.largeTitle)
                .foregroundColor(.green)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
