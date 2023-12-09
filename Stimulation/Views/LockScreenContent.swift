//
//  LockScreenContent.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
//

import SwiftUI

struct LockScreenContent: View {
    @StateObject private var dateViewModel = DateViewModel()
    
    @State private var isTextVisible = false
    @State private var currentMessageIndex = 0
    @State private var displayedMessage: Message?
    
    var messages: [Message] = load("messages.json")
    
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
                                
                                // Displayed message notification
                                if let message = displayedMessage {
                                    MessageItem(message: message)
                                        .transition(.slide)
                                        .onAppear {
                                            // Start a timer to update the displayed message notification
                                            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                                                withAnimation {
                                                    updateDisplayedMessage()
                                                }
                                            }
                                        }
                                }
                                
                                Spacer()
                                
                                // Additional text to appear from the bottom
                                if isTextVisible {
                                    withAnimation(Animation.easeInOut(duration: 1)) {
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
                                }
                            }
                        }
                            
                        )
                }
    }
    
    private func updateDisplayedMessage() {
            if currentMessageIndex < messages.count {
                displayedMessage = messages[currentMessageIndex]
                currentMessageIndex += 1
            } else {
                currentMessageIndex = 0
                displayedMessage = nil
            }
        }
}

#Preview {
    LockScreenContent()
}
