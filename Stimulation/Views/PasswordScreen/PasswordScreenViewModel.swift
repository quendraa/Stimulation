//
//  PasswordScreenViewModel.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 10/12/2023.
//

import Foundation

class PasswordScreenViewModel: ObservableObject {
    @Published var enteredNumbers: [Int] = []
    @Published var showHomeScreen: Bool = false
    @Published var showErrorMessage: Bool = false
    @Published var showPasswordScreen: Bool = false

    // The correct password (dog)
    private let correctPassword = [3, 6, 6, 6, 4]

    func pressNumber(_ number: Int) {
        showErrorMessage = false
        
        if enteredNumbers.count < correctPassword.count {
            enteredNumbers.append(number)
        }

        if enteredNumbers.count == correctPassword.count {
            checkPassword()
        }
    }

    func checkPassword() {
        // Check if entered numbers match the correct password
        if enteredNumbers == correctPassword {
            self.showHomeScreen = true
            self.showPasswordScreen = false
        } else {
            showErrorMessage = true
        }

        enteredNumbers = []
    }
}
