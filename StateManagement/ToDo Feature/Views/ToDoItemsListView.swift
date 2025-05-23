//
//  ContentView.swift
//  StateManagement
//
//  Created by Aleksandr on 14.05.2025.
//

import SwiftUI

struct ToDoItemsListView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Group {
            if viewModel.toDoItems.isEmpty {
                Text("Загрузка...")
                    .padding()
            } else {
                NavigationStack {
                    List {
                        ForEach($viewModel.toDoItems) { $item in
                            NavigationLink(value: item) {
                                ToDoItemRow(toDoItem: $item)
                            }
                        }
                        .onDelete(perform: viewModel.deleteAt(_:))
                        .onMove(perform: viewModel.moveAt(from:to:))
                    }
                    .navigationTitle("Today's To-Dos")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            EditButton()
                        }
                    }
                    .navigationDestination(for: ToDoItem.self) { toDoItem in
                        let toDoItemBinding = Binding(
                            get: {
                                viewModel.toDoItems.first(where: {$0.id == toDoItem.id })!
                            },
                            set: { newItem in
                                let index = viewModel.toDoItems.firstIndex(where: {$0.id == toDoItem.id })!
                                viewModel.toDoItems[index] = newItem
                            }
                        )
                        ToDoItemDetailView(toDoItem: toDoItemBinding)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ToDoItemsListView()
}
