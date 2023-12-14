//
//  MissionMosaicApp.swift
//  MissionMosaic
//
//  Created by Khan on 12.12.23.
//

import SwiftUI

/*
 
 MVVM Architecture

 Model - data point
 View - UI
 ViewModel - manages Models for View

 */

@main
struct MissionMosaicApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                ListView() 
            }
            .environmentObject(listViewModel)
           
        }
    }
}
