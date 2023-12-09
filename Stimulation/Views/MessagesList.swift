//
//  MessagesList.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
//

import SwiftUI

struct MessagesList: View {
    var body: some View {
        List{
            MessageItem(message: messages[0])
        }
    }
}

#Preview {
    MessagesList()
}
