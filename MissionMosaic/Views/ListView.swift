//
//  ListView.swift
//  MissionMosaic
//
//  Created by Khan on 12.12.23.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
    
        ItemModel(title: "This is the First Title", isCompleted: false),
        ItemModel(title: "This is the Second Title", isCompleted: true),
        ItemModel(title: "Third", isCompleted: false)
    ]
    var body: some View {
     
        List {
           
            ForEach(items) { item in
                ListRowView(item: item)
            }.onDelete(perform: delete(indexSet:))
                .onMove { indices, newOffset in
                    
                }
            }
            
        .listStyle(PlainListStyle())
        .navigationTitle("Mission List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
    
    func delete(indexSet: IndexSet) {
        
        items.remove(atOffsets: indexSet)
    }
    func onMove (indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
}




struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
    }
}


