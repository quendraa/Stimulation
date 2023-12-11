//
//  PasswordScreenContent.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 10/12/2023.
//

import SwiftUI

struct PasswordScreenContent: View {
    @StateObject private var viewModel = PasswordScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Enter Password")
                .font(.title)
                .foregroundColor(.white)
            
            Text("Hint: Spell dog")
                .font(.headline)
                .foregroundColor(.white)
                .padding(20)
            
            if viewModel.showErrorMessage {
                Text("Incorrect password, please try again.")
                    .foregroundColor(.red)
                    .font(.headline)
            }
            
            HStack{
                Button(action: {
                    viewModel.pressNumber(1)
                }) {
                    PasswordButtonView(number: 1, letters: nil)
                }
                
                Button(action: {
                    viewModel.pressNumber(2) 
                }) {
                    PasswordButtonView(number: 2, letters: "ABC")
                }
                
                Button(action: {
                    viewModel.pressNumber(3)
                }) {
                    PasswordButtonView(number: 3, letters: "DEF")
                }
            }
            
            HStack{
                Button(action: {
                    viewModel.pressNumber(4)
                }) {
                    PasswordButtonView(number: 4, letters: "GHI")
                }
                
                Button(action: {
                    viewModel.pressNumber(5)
                }) {
                    PasswordButtonView(number: 5, letters: "JKL")
                }
                
                Button(action: {
                    viewModel.pressNumber(6)
                }) {
                    PasswordButtonView(number: 6, letters: "MNO")
                }
            }
            
            HStack{
                Button(action: {
                    viewModel.pressNumber(7) 
                }) {
                    PasswordButtonView(number: 7, letters: "PQRS")
                }
                
                Button(action: {
                    viewModel.pressNumber(8)
                }) {
                    PasswordButtonView(number: 8, letters: "TUV")
                }
                
                Button(action: {
                    viewModel.pressNumber(9)
                }) {
                    PasswordButtonView(number: 9, letters: "WXYZ")
                }
            }
            
            HStack{
                Button(action: {
                    viewModel.pressNumber(0)
                }) {
                    PasswordButtonView(number: 0, letters: nil)
                }
            }
            
        }
        .environmentObject(viewModel) // Inject the ViewModel into the environment
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.9))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PasswordScreenContent()
}
