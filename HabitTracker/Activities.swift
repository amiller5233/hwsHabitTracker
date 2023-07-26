//
//  Activities.swift
//  HabitTracker
//
//  Created by Adam Miller on 7/25/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encodedItems = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "HabitTracker-Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "HabitTracker-Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
