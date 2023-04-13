//
//  MainView.swift
//  foodDice
//
//  Created by cnu on 2023/02/22.
//

import SwiftUI
import GoogleMobileAds

struct MainFunctionView: View {
    @State var isShowResult = 0
    @State var menuStringResult = ""
    @Binding var colorMainValue: Color
    @Binding var colorSubValue: Color
    @Binding var menuArray: Array<String>
    @Binding var isFirstHelpmenual: Bool
    @State var selectionOption = 0
    var body: some View {
        NavigationView {
            ZStack{
                colorMainValue
                    .ignoresSafeArea()
                VStack {
                    HStack {
//                        Spacer()
//                            .frame(width: 10)
                        
                        Spacer()
                        NavigationLink {
                            EditMenuArrayModal(colorMainValue: $colorMainValue, colorSubValue: $colorSubValue, menuArray: $menuArray, selectionOption: $selectionOption)
                        } label: {
                            Image(systemName: "plus.square.fill")
                                .font(.system(size: 22))
                                .foregroundColor(colorSubValue)
                        }
                        NavigationLink {
                            HelpModalView(colorMainValue: $colorMainValue, colorSubValue: $colorSubValue, isFirstHelpmenual: $isFirstHelpmenual)
                        } label: {
                            Image(systemName: "questionmark.app.fill")
                                .font(.system(size: 22))
                                .foregroundColor(colorSubValue)
                        }
                        Spacer()
                            .frame(width: 10)
                    }
                    Divider()
                    VStack{
                        HStack {
                            Spacer()
                            ColorPicker(selection: $colorMainValue) {
                                Text("")
                            }
                            .onDisappear {
                                return colorData.saveMainColor(color: colorMainValue)
                            }
                            Spacer()
                                .frame(width: 10)
                        }
                        HStack {
                            Spacer()
                            ColorPicker(selection: $colorSubValue) {
                                Text("")
                            }
                            .onDisappear {
                                return colorData.saveSubColor(color: colorSubValue)
                            }
                            Spacer()
                                .frame(width: 10)
                        }
                    }
                    Spacer()
                        .frame(height: 150)
                    if isShowResult > 0 {
                        let menuString = String(menuArray.randomElement() ?? "error")
                        Text(menuString)
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(colorSubValue)
                        Spacer()
                            //.frame(height: 10)
                        MapPickerView(colorMainValue: $colorMainValue,
                                      colorSubValue: $colorSubValue,
                                      menuArray: $menuArray,
                                      menuString: menuString,
                                      selectionOption: $selectionOption)
                        
                    }
                    VStack {
                        Spacer()
                        Button {
                            SoundManager.instance.playSound()
                            if isShowResult > 100 {
                                isShowResult = 1
                            } else {
                                isShowResult += 1
                            }
                        } label: {
                            Image(systemName: "die.face.3.fill")
                                .font(.system(size: imageSizeScale))
                                .foregroundColor(colorSubValue)
                        }
                        Text("Roll a Dice!")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(colorSubValue)
                        Spacer()
                        //BannerView()
                        adView()
                    }
                    
                }
                .padding()
            }
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}
