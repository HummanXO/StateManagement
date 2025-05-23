//
//  ToDoItemDetailView.swift
//  StateManagement
//
//  Created by Aleksandr on 22.05.2025.
//
import Foundation
import SwiftUI

struct ToDoItemDetailView: View {
    
    @Binding var toDoItem: ToDoItem
    
    var body: some View {
        Form {
            TextField("Title", text: $toDoItem.title)
                .font(.headline)
            
            TextField("Discription", text: Binding(
                get: { toDoItem.body ?? "" },
                set: { toDoItem.body = $0 }
            ))
                .font(.subheadline)
        }
        .navigationTitle("Edit")
    }
}

#Preview {
    
    let toDoItem = ToDoItem(id: 214, title: "Some text")
    
    StatefulPreviewWrapper(value: toDoItem) { toDoItem in
        ToDoItemDetailView(toDoItem: toDoItem)
    }
}
