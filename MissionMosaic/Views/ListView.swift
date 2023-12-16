//
//  ListView.swift
//  MissionMosaic
//
//  Created by Khan on 12.12.23.
//

import SwiftUI

struct ListView: View {
  
    @EnvironmentObject var listViewModel: ListViewModel
  
    
    var body: some View {
     
        ZStack {
            
            if listViewModel.items.isEmpty {
                Text("No List")
            }
            else
            {
                List {
                   
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }.onDelete(perform: listViewModel.delete(indexSet:))
                        .onMove (perform: listViewModel.onMove(indices:newOffset:))
                            
                    }
                    
                .listStyle(PlainListStyle())
            }
        }
        
        
        .navigationTitle("Mission List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
    
   
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


