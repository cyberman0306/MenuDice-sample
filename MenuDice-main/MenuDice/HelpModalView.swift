//
//  HelpModalView.swift
//  foodDice
//
//  Created by cnu on 2023/02/21.
//

import SwiftUI
import StoreKit

struct HelpModalView: View {
    @Environment(\.requestReview) var requestReview
    @Binding var colorMainValue: Color
    @Binding var colorSubValue: Color
    @Binding var isFirstHelpmenual: Bool
    var body: some View {
        if Language.toString() == "한국" {
            VStack {
                Text("How to use")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("roll it!을 눌러 메뉴를 골라봅시다")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("표시된 메뉴를 눌러 근처 지도를 탐색해 봅시다")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("상단의 팔레트로 색을 바꾸면 자동으로 저장됩니다")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("+에 들어가서 메뉴 목록을 눌러 지도를 열고")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("옆으로 밀어 지우고, 직접 메뉴를 입력해봅시다")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Button {
                    requestReview()
                } label: {
                    Text("앱 리뷰하기!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorMainValue)
                        .padding()
                }
                
                if isFirstHelpmenual == false {
                    Divider()
                    Button {
                        isFirstHelpmenual = true
                        helpMenualData.saveIsFirstHelpMenual(boolValue: isFirstHelpmenual)
                    } label: {
                        Text("알겠어요")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .font(.system(size: 20))
                            .frame(width: 320, height: 75)
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                    
                    
                }
                
            }
            .padding()
        } else {
            VStack {
                Text("How to use")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("Let's press roll it! to choose a menu")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("Let's click the displayed menu to navigate the nearby map")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("If you change the color to the top palette, it will be saved automatically")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("Go into + and tap the menu list to open the map")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Text("Push sideways, erase, enter your own menu")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(colorMainValue)
                    .padding()
                Button {
                    requestReview()
                } label: {
                    Text("Review the app!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(colorMainValue)
                        .padding()
                }
                
                if isFirstHelpmenual == false {
                    Divider()
                    Button {
                        isFirstHelpmenual = true
                        helpMenualData.saveIsFirstHelpMenual(boolValue: isFirstHelpmenual)
                    } label: {
                        Text("알겠어요")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .font(.system(size: 20))
                            .frame(width: 320, height: 75)
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                    
                    
                }
                
            }
            .padding()
        }
        }
    }


struct HelpModalView_Previews: PreviewProvider {
    @State static var colorMainValue: Color = colorMain.setMainColor()
    @State static var colorSubValue: Color = colorMain.setSubColor()
    @State static var isFirstHelpmenual: Bool = false
    
    static var previews: some View {
        HelpModalView(colorMainValue: $colorMainValue, colorSubValue: $colorSubValue, isFirstHelpmenual: $isFirstHelpmenual)
    }
}
