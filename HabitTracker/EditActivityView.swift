//
//  EditActivityView.swift
//  HabitTracker
//
//  Created by Adam Miller on 7/25/23.
//

import SwiftUI

struct EditActivityView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    
    @State var activity: Activity
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Activity Summary")
                        .font(.title.weight(.bold))
                    
                    Text(activity.name)
                    
                    Text(activity.description)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(15)
                
                Button("Complete Now") {
                    let newCompletion = Activity.Completion()
                    activity.completions.append(newCompletion)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                
                Divider()
                    .padding([.top, .bottom], 20)
                
                VStack(alignment: .leading) {
                    Text("History")
                        .font(.title.weight(.bold))
                    
                    List {
                        ForEach(activity.completions, id: \.completedAt) { completion in
                            Text("\(completion.formattedCompletedAt)")
                        }
                    }
                }
                
                
            }
            .padding()
            .navigationTitle("Edit Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct EditActivityView_Previews: PreviewProvider {
    
    static var activity = Activity(name: "Test", description: "Test description", completions: [])
    
    static var previews: some View {
        EditActivityView(activities: Activities(), activity: activity)
    }
}
