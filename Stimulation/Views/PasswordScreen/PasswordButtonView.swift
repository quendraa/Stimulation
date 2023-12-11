//
//  PasswordButtonView.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 10/12/2023.
//

import SwiftUI

struct PasswordButtonView: View {
    @EnvironmentObject var viewModel: PasswordScreenViewModel
    
    let number: Int
    let letters: String?

    var body: some View {
        VStack {
            Button(action: {
                viewModel.pressNumber(number)
            }) {
                Circle()
                    .stroke(Color.white, lineWidth: 2)
                    .frame(width: 90, height: 90)
                    .overlay(
                        VStack {
                            Text("\(number)")
                                .font(.largeTitle)
                                .foregroundColor(.white)

                            if let letters = letters {
                                Text(letters)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            } else {
                                Text("")
                            }
                        }
                    ).padding(10)
            }
            
            
        }
    }
}

#Preview {
    PasswordScreenContent()
            .environmentObject(PasswordScreenViewModel())
}
