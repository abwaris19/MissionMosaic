//
//  ItemModel.swift
//  MissionMosaic
//
//  Created by Khan on 13.12.23.
//

import Foundation

struct ItemModel: Identifiable {
    
    let id: String  = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
