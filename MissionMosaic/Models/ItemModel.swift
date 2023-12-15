//
//  ItemModel.swift
//  MissionMosaic
//
//  Created by Khan on 13.12.23.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable {
    
    let id: String
    var title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}



