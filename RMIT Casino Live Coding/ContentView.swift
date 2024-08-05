//
//  ContentView.swift
//  RMIT Casino Live Coding
//
//  Created by Tom Huynh on 5/8/24.
//

import SwiftUI

struct ContentView: View {
    let icons = ["apple","bar","cherry","clover","diamond", "grape", "heart", "horseshoe","lemon","melon","money","orange"]
    
    @State private var reels = [0,1,2]
    
    // MARK: - Spin Logic
    func spinReels(){
        reels[0]=Int.random(in: 0...icons.count-1)
        reels[1]=Int.random(in: 0...icons.count-1)
        reels[2]=Int.random(in: 0...icons.count-1)
    }
    
    // MARK: - Check Winning Logic
    // MARK: - Player Winning Logic
    // MARK: - Highscore Logic
    // MARK: - Player Lose Logic
    // MARK: - Bet 20 Logic
    // MARK: - Bet 10 Logic
    // MARK: - Gameover
    // MARK: - Reset Game Logic
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            LinearGradient(gradient: Gradient(colors: [Color("ColorRedRMIT"), Color("ColorPurpleRMIT")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                // MARK: - Logo
                LogoView(logoFileName: "rmit-casino-welcome-logo")
                
                // MARK: - Score boards
                HStack {
                    HStack{
                        Text("Your\nMoney".uppercased())
                            .modifier(scoreLabelStyle())
                            .multilineTextAlignment(.leading)
                        
                        Text("100")
                            .modifier(scoreNumberStyle())
                    }
                    .modifier(scoreCapsuleStyle())
                    
                    Spacer()
                    
                    HStack{
                        Text("200")
                            .modifier(scoreNumberStyle())
                        
                        Text("High\nScore".uppercased())
                            .modifier(scoreLabelStyle())
                            .multilineTextAlignment(.trailing)
                    }
                    .modifier(scoreCapsuleStyle())
                }
                
                // MARK: - Slot Machine
                VStack {
                    
                    // MARK: - First Reel
                    ZStack {
                        Image("reel")
                            .resizable()
                            .modifier(ReelImageModifier())
                        Image(icons[reels[0]])
                            .resizable()
                            .modifier(IconImageModifier())
                    }
                    
                    HStack {
                        // MARK: - Second Reel
                        ZStack {
                            Image("reel")
                                .resizable()
                                .modifier(ReelImageModifier())
                            Image(icons[reels[1]])
                                .resizable()
                                .modifier(IconImageModifier())
                        }
                        
                        Spacer()
                        
                        // MARK: - Third Reel
                        ZStack {
                            Image("reel")
                                .resizable()
                                .modifier(ReelImageModifier())
                            Image(icons[reels[2]])
                                .resizable()
                                .modifier(IconImageModifier())
                        }
                    }
                    
                    // MARK: - Spin Button
                    Button(action: {
                        print("Spin!!!")
                        spinReels()
                    }, label: {
                        Image("spin")
                            .resizable()
                            .modifier(ReelImageModifier())
                    })

                }
                
                // MARK: - Footer
                HStack {
                    
                    // MARK: - Bet 20
                    HStack(spacing: 30) {
                        Text("20")
                            .modifier(BetCapsuleModifier())
                        
                        Image("casino-chips")
                            .resizable()
                            .modifier(CasinoChipModifier())
                    }
                    
                    Spacer()
                    
                    // MARK: - Bet 10
                    HStack(spacing: 30) {
                        Image("casino-chips")
                            .resizable()
                            .modifier(CasinoChipModifier())
                            .opacity(0)
                        Text("10")
                            .modifier(BetCapsuleModifier())
                            
                    }
                    
                }
                .padding(.horizontal, 20)

            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
