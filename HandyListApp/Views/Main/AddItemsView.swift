//
//  AddItemsView.swift
//  HandyListApp
//
//  Created by iosdev on 12.4.2022.
//

import SwiftUI

struct AddItemsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText:String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    TextField("Type something here...", text: $textFieldText)
                        .frame(height: 55)
                        .background(Color(.lightGray))
                        .cornerRadius(10)
                    
                    Button(action: saveButtonPressed, label: {
                        Text("Add".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                            .padding()
                        
                    })
                    
                }
                .padding(14)
            }
           
        .alert(isPresented: $showAlert, content: getAlert)
     
        }
        .navigationTitle("Add Shopping List Item")
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3  {
            alertTitle = "Your Shopping list item must be at least 3 characters😇"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItemsView()
        }
        .environmentObject(ListViewModel())
    }
}
