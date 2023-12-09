//
//  LockScreenContent.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 09/12/2023.
//

import SwiftUI
import Combine

struct LockScreenContent: View {
    @StateObject private var dateViewModel = DateViewModel()
    
    @State private var isTextVisible = false
    @State private var displayedMessages: [Message] = []
    @State private var currentIndex = 0
    
    private var messages: [Message] = load("messages.json")
    
    var body: some View {
        VStack {
                    // Custom background
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            VStack(alignment: .center){
                                // Lock symbol text
                                Image(systemName: "lock.fill")
                                    .font(.system(size: 20)) // Adjust the size as needed
                                    .foregroundColor(.white)
                                    .padding()
                                
                                Text(dateViewModel.currentDateText)
                                    .foregroundColor(.white)
                                
                                Text(dateViewModel.currentTimeText)
                                    .font(.system(size: 98))
                                    .foregroundColor(.white)
                                
                                // Displayed message notifications
                                ForEach(displayedMessages, id: \.id) { message in
                                    withAnimation(Animation.easeInOut(duration: 4)) {
                                        MessageItem(message: message)
                                            .transition(.move(edge: .bottom))
                                    }
                                }
                                
                                Spacer()
                                
                                // Additional text to appear from the bottom
                                if isTextVisible {
                                    withAnimation(Animation.easeInOut(duration: 1.5)) {
                                        Text("Swipe up to unlock")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .transition(.move(edge: .bottom))
                                    }
                                }
                            }
                            .onAppear {
                            // Start a timer to show the additional text after 4 seconds
                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                withAnimation {
                                    isTextVisible.toggle()
                                    startDisplayingMessages()
                                }
                            }
                            }.padding(.horizontal, 25)
                            
                        )
                }
    }
    
    private func startDisplayingMessages() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            if currentIndex < messages.count {
                withAnimation {
                    displayedMessages.append(messages[currentIndex])
                    currentIndex += 1
                }
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    LockScreenContent()
}
