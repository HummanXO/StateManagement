//
//  ViewModel.swift
//  StateManagement
//
//  Created by Aleksandr on 15.05.2025.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var toDoItems: [ToDoItem] = []
    
   public func fetchData() {
        
       guard toDoItems.isEmpty else { return }
       
        let apiService = APIService()
        apiService.fetchData { [weak self] (result: Result<[ToDoItem], APIError>) in
            switch result {
            case .success(let toDoItems):
                print("✅ Загружено: \(toDoItems.count) элементов") 
                self?.toDoItems = toDoItems
            case .failure(let failure):
                print("❌ Ошибка: \(failure)")
            }
       }
    }
    
    func deleteAt(_ indexSet: IndexSet) {
        toDoItems.remove(atOffsets: indexSet)
    }
    func moveAt(from indexSet: IndexSet, to destination: Int) {
        toDoItems.move(fromOffsets: indexSet, toOffset: destination)
    }
}
