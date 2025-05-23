//
//  ToDoItemRow.swift
//  StateManagement
//
//  Created by Aleksandr on 14.05.2025.
//

import SwiftUI


struct ToDoItemRow: View {
    
    @Binding var toDoItem: ToDoItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Button(action: {
                toDoItem.isCompleted = !(toDoItem.isCompleted ?? false)
            }) {
                Image(systemName: (toDoItem.isCompleted ?? false) ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle((toDoItem.isCompleted ?? false) ? Color.green : Color.gray)
                    .padding()
            }
            .buttonStyle(.plain)
            .contentShape(Rectangle())
            
            VStack(alignment: .leading) {
                Text(toDoItem.title)
                    .font(.headline)
                    .strikethrough(toDoItem.isCompleted ?? false, color: .gray)
                    .foregroundStyle((toDoItem.isCompleted ?? false) ? Color.gray : .primary)

                if let body = toDoItem.body {
                    Text(body)
                        .font(.subheadline)
                }
            }

            Spacer()
        }
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 70)) {
    ToDoItemRow(toDoItem: .constant(ToDoItem(id: 1, title: "Hello")))
}
