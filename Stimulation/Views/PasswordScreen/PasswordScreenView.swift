//
//  PasswordScreenView.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
//

import SwiftUI

struct PasswordScreenView: View {
    var body: some View {
            // Your password screen UI
            VStack {
                Text("Enter Password")
                    .font(.title)
                // Add round buttons with numbers here
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PasswordScreenView()
}
