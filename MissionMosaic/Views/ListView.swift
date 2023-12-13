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
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Mission List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
    }
}


