//
//  Activity.swift
//  HabitTracker
//
//  Created by Adam Miller on 7/25/23.
//

import Foundation

struct Activity: Identifiable, Codable {
    
    struct Completion: Codable {
        let completedAt: Date
    }
    
    var id = UUID()
    let name: String
    let description: String
    var completions: [Completion]
}
