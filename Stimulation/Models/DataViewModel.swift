//
//  DataViewModel.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
//

import Foundation
import Combine

class DateViewModel: ObservableObject {
    @Published var currentDateText: String = DateViewModel.currentDate()
    @Published var currentTimeText: String = DateViewModel.currentTime()

    private var cancellables: Set<AnyCancellable> = []

    init() {
        startObservingTime()
    }

    private func startObservingTime() {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.currentTimeText = DateViewModel.currentTime()
            }
            .store(in: &cancellables)

        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.currentDateText = "yes"
        }
    }

    // Function to get the current date
    private static func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE d, yyyy"
        return formatter.string(from: Date())
    }

    // Function to get the current time
    private static func currentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm "
        return formatter.string(from: Date())
    }
    
}
