//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Adam Miller on 7/25/23.
//

import SwiftUI

struct AddActivityView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description, axis: .vertical)
                    .lineLimit(4)
            }
            .navigationTitle("Add Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newActivity = Activity(name: name, description: description, completions: [])
                        activities.items.append(newActivity)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
