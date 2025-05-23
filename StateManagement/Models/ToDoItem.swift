//
//  ToDoItem.swift
//  StateManagement
//
//  Created by Aleksandr on 15.05.2025.
//

import Foundation

struct ToDoItem: Hashable, Decodable, Identifiable {
    var id: Int
    var title: String
    var body: String?
    var isCompleted: Bool? = false
}
