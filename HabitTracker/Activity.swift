//
//  Activity.swift
//  HabitTracker
//
//  Created by Adam Miller on 7/25/23.
//

import Foundation

struct Activity: Identifiable, Codable {
    
    struct Completion: Codable {
        var completedAt = Date()
        
        var formattedCompletedAt: String {
            completedAt.formatted(date: .abbreviated, time: .standard)
        }
    }
    
    var id = UUID()
    let name: String
    let description: String
    var completions: [Completion]
}
