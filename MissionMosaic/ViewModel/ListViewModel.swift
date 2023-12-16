//
//  ListViewModel.swift
//  MissionMosaic
//
//  Created by Khan on 14.12.23.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
        let itemsKey: String = "items_list"

    
    init() {
        getItems()
        
    }
    
    func getItems() {

        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
    
    func delete(indexSet: IndexSet) {
        
        items.remove(atOffsets: indexSet)
    }
    func onMove (indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem(title: String ) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem (item: ItemModel){
        
     
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
