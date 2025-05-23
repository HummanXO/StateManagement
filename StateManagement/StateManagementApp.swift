//
//  StateManagementApp.swift
//  StateManagement
//
//  Created by Aleksandr on 14.05.2025.
//

import SwiftUI

@main
struct StateManagementApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ToDoItemsListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("To-Do Items")
                    }
                AboutView()
                    .tabItem {
                        Image(systemName: "questionmark.circle.fill")
                        Text("About")
                    }
            }
        }
    }
}
