//
//  MessageView.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 09/12/2023.
//

import SwiftUI

struct MessageItem: View {
    var message: Message
    
    var body: some View {
            HStack {
                VStack {
                    Image("messagesIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.sender)
                        .font(.headline)
                    Text(message.content)
                        .font(.body)
                }
                .layoutPriority(1)
                
                Spacer()
                
                Text(Self.dateFormatter.string(from: message.timestamp))
                    .padding(.trailing)
                    .layoutPriority(2)
            }
            .padding(8) // Padding around the entire content
            .background(Color.white.opacity(0.6))
            .cornerRadius(12) // Adjust the corner radius as needed
            .shadow(radius: 3) // Add shadow for depth
        }
    
    // DateFormatter for formatting the timestamp
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter
    }()
}

#Preview("message 1") {
    MessageItem(message: messages[0])
}

#Preview("message 2"){
    MessageItem(message: messages[1])
}
