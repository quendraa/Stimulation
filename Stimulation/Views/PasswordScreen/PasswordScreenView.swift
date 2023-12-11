//
//  PasswordScreenView.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 09/12/2023.
//

import SwiftUI

struct PasswordScreenView: View {
    @EnvironmentObject var viewModel: PasswordScreenViewModel

    var body: some View {
        PasswordScreenContent()
            .navigationBarHidden(true)
            .onChange(of: viewModel.showHomeScreen) { newValue in
                if newValue {
                    viewModel.showPasswordScreen = false
                }
            }
    }
}


#Preview {
    PasswordScreenView()
}
