//
//  EditMenuArrayModal.swift
//  foodDice
//
//  Created by yook on 2023/02/21.
//

import SwiftUI

struct EditMenuArrayModal: View {
    @State var textfieldText: String = ""
    @State var TapString: String = ""
    @State private var alertShowing = false
    @Binding var colorMainValue: Color
    @Binding var colorSubValue: Color
    @Binding var menuArray: Array<String>
    @Binding var selectionOption: Int
    
    func deleteItem(at offsets: IndexSet) -> () {
        menuArray.remove(atOffsets: offsets)
        menuData.saveMenuArray(saveArray: menuArray)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("add new menu !", text: $textfieldText)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                if textfieldText != "" {
                    Button {
                        menuArray.append(textfieldText)
                        menuData.saveMenuArray(saveArray: menuArray)
                        textfieldText = ""
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(colorMainValue)
                    }
                    .padding()
                }
            }
            
            List {
                Section("Menu") {
                    ForEach(menuArray, id: \.self) { value in
                        Button {
                            //searchItemWithNavermap(value: value)
                            SearchWithSelectedMapAndMenu(selectionOption, value)
                        } label: {
                            Text(value)
                        }
                        .font(.body.bold())
                        .foregroundColor(colorMainValue)
                    }
                    .onDelete(perform: deleteItem)
                }

                Section {
                    Button("reset menu!") {
                        alertShowing.toggle()
                    }
                    .font(.body.bold())
                    .foregroundColor(Color.red)
                    .alert(isPresented: $alertShowing) {
                        let firstButton = Alert.Button.destructive(Text("초기화")) {
                            menuArray = menuData.loadDefaultMenuArray()
                            menuData.saveMenuArray(saveArray: menuArray)
                        }
                        let secondButton = Alert.Button.cancel(Text("취소")) {
                        }
                        return Alert(title: Text("메뉴 목록 리셋"),
                                     message: Text("목록을 초기화 하시겠습니까?"),
                                     primaryButton: firstButton, secondaryButton: secondButton)
                    }
                }

            }
            adView()
            
        }
        
        
    }
}


