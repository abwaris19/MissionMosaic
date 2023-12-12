//
//  ListView.swift
//  MissionMosaic
//
//  Created by Khan on 12.12.23.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [ "This is the first title", "This is the second title", "Third"]
    var body: some View {
     
        List {
           
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Mission List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: Text("Destination")))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
    }
}


