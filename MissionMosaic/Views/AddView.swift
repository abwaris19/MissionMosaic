//
//  AddView.swift
//  MissionMosaic
//
//  Created by Khan on 12.12.23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("EditTextColor"))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                    
                } label: {
                    
                    Text("Save".uppercased())
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(14)
            
        }
        .navigationTitle("Add an Item ")
        .alert(isPresented: $showAlert, content: {
            showAlertMessage()
        })
    }
        
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
       
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func showAlertMessage() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                AddView()
            }
            .environmentObject(ListViewModel())
        }
    }
}
