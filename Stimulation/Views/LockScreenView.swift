//
//  LockScreenView.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
//

import SwiftUI

struct LockScreenView: View {
    @State private var isPasswordScreenPresented = false

        var body: some View {
            ZStack {
                // Your lock screen UI
                LockScreenContent()
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.height > 50 {
                                    // You can customize the threshold for swipe detection
                                    self.isPasswordScreenPresented.toggle()
                                }
                            }
                    )

                if isPasswordScreenPresented {
                    PasswordScreenView()
                }
            }
        }
}

#Preview {
    LockScreenView()
}


