//
//  MapPickerView.swift
//  MenuDice
//
//  Created by cnu on 2023/03/14.
//

import SwiftUI

struct MapPickerView: View {

    @Binding var colorMainValue: Color
    @Binding var colorSubValue: Color
    @Binding var menuArray: Array<String>
    var menuString: String
    @State var selectedMap = ""
    @Binding var selectionOption: Int
    var options = ["Naver maps", "Apple maps", "KaKao Maps", "Google Maps"]
    
    
    var body: some View {
        VStack {
            Picker("Select Choice", selection: $selectionOption) {
                ForEach(0 ..< options.count) {
                    Text(options[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Button {
                print("search in \(options[selectionOption])")
                SearchWithSelectedMapAndMenu(selectionOption, menuString)

            } label: {
                Text("Search in \(options[selectionOption])")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(colorSubValue)
            }

        }
    }
}
