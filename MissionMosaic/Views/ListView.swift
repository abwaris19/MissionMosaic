//
//  ListView.swift
//  MissionMosaic
//
//  Created by Khan on 12.12.23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
     
        List {
           
            ListRowView()
        }
        .navigationTitle("Mission List 📝")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
    }
}

struct ListRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text("This is the firt Item")
            Spacer()
        }
    }
}
