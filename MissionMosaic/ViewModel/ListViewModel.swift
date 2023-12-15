//
//  ListViewModel.swift
//  MissionMosaic
//
//  Created by Khan on 14.12.23.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            
            ItemModel(title: "This is the First Title", isCompleted: false),
            ItemModel(title: "This is the Second Title", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
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
}
