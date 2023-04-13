//
//  ContentView.swift
//  foodDice
//
//  Created by yook on 2023/02/20.
//

import SwiftUI

struct ContentView: View {
    @State var colorMainValue = colorData.loadMainColor()
    @State var colorSubValue = colorData.loadSubColor()
    @State var MenuData = menuData.loadMenuArray()
    @State var isFirstHelpmenual = helpMenualData.loadIsFirstHelpMenual()
    var body: some View {
        if isFirstHelpmenual == true {
            ZStack {
                colorMainValue
                    .ignoresSafeArea()
                VStack {
                    MainFunctionView(colorMainValue: $colorMainValue, colorSubValue: $colorSubValue, menuArray: $MenuData, isFirstHelpmenual: $isFirstHelpmenual)
                }
            }
        } else {
            HelpModalView(colorMainValue: $colorMainValue, colorSubValue: $colorSubValue, isFirstHelpmenual: $isFirstHelpmenual)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
