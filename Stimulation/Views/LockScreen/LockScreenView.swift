//
//  LockScreenView.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 09/12/2023.
//

import SwiftUI

struct LockScreenView: View {
    @State private var isPasswordScreenPresented = false
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        ZStack {
            // Your lock screen UI
            LockScreenContent()
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.height < 0 {
                            isPasswordScreenPresented.toggle()
                        }
                }))

            if isPasswordScreenPresented {
                PasswordScreenView()
            }
        }
    }
}

#Preview {
    LockScreenView()
}


