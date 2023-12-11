//
//  LockScreenView.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 09/12/2023.
//

import SwiftUI

struct LockScreenView: View {
    @EnvironmentObject private var viewModel: PasswordScreenViewModel

    var body: some View {
        ZStack {
            if viewModel.showHomeScreen {
                HomeScreenView()
            } else {
                LockScreenContent()
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.height < 0 {
                                viewModel.showPasswordScreen.toggle()
                            }
                        }))
            }
        }
        .fullScreenCover(isPresented: $viewModel.showPasswordScreen) {
            PasswordScreenView()
        }
    }
}



#Preview {
    LockScreenView()
}


