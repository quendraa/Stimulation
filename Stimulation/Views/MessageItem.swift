//
//  MessageView.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
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
                    .frame(width: 40, height: 40) // Adjust the size as needed
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 4) { // Adjust the spacing as needed
                Text(message.sender)
                    .font(.headline)
                Text(message.content)
                    .font(.body)
            }
            .layoutPriority(1) // Allow this VStack to expand if needed
            
            Spacer() // Pushes the timestamp to the right
            
            // Display formatted timestamp using Text and DateFormatter
            Text(Self.dateFormatter.string(from: message.timestamp))
                .padding(.trailing)
        }
            
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
