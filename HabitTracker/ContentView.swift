//
//  ContentView.swift
//  HabitTracker
//
//  Created by Adam Miller on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showAddActivityView = false
    @State private var showEditActivityView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    HStack {
                        Text("\(activity.name)")
                    }
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showAddActivityView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddActivityView) {
                AddActivityView(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
