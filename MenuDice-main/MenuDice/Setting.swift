//
//  Setting.swift
//  foodDice
//
//  Created by cnu on 2023/02/23.
//

import SwiftUI

var colorMain = ColorSetting(colorSetMain: Color.blue, colorSetSub: Color.white)
var colorMainTest = ColorSetting(colorSetMain: Color.gray, colorSetSub: Color.white)
var colorData = ColorData()
let naverMapappStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!
let kakaoMapappStoreURL = URL(string: "https://apps.apple.com/us/app/id304608425")!
let googleMapappStoreURL = URL(string: "https://apps.apple.com/kr/app/google-maps/id585027354")!
var menuData = MenuData(defaultMenuArrayKorean: defaultMenuArrayKorean, defaultMenuArrayEnglish: defaultMenuArrayEnglish)
var helpMenualData = HelpMenualData()
let imageSizeScale = 30.0
let Language: LocalizedStringKey = "Language"

var defaultMenuArrayKorean = ["라면", "삼겹살", "치킨", "쌀국수",
               "돈까스", "족발", "떡볶이",
               "초밥", "김밥", "햄버거",
               "소고기", "만두", "냉면", "샤브샤브",
               "제육볶음", "칼국수", "타코", "해장국",
               "수제비", "생선구이", "라멘", "서브웨이",
               "쭈꾸미볶음", "편의점", "밥버거", "갈비탕",
               "우동", "순대국", "불고기", "낙지볶음",
               "순두부", "카레", "한솥", "김피탕",
               "백반", "청국장", "샌드위치", "부리또",
               "맘스터치", "롯데리아", "버거킹", "KFC",
               "닭볶음탕", "닭갈비", "파스타", "피자",
               "마라탕", "텐동", "보쌈", "철판요리", "쭈꾸미볶음",
               "육회", "브런치", "오꼬노미야키", "연어",
               "찜닭", "빵집", "나베", "중국집", "토스트"]

var defaultMenuArrayEnglish = ["Ramen", "Pork", "Chicken", "Rice noodles",
                               "Tteokbokki", "Asian", "Mexican", "BBQ", "Seafood",
                               "Sushi", "Gimbap", "Burgers",
                               "Beef", "Dumpling", "Steakhouse", "Italian",
                               "Taco", "peanut butter jelly", "Taco Bell",
                               "Grilled fish", "Subway",
                               "Convenience store", "korean BBQ",
                               "Ihop", "waffle house", "ARBY'S",
                               "curry", "mcdonald's", "Dunkin", "Pizza Hut",
                               "Sandwich", "Burrito", "chipotle", "Chick-fil-A",
                               "Burger King", "KFC", "Hot Dog",
                               "Pasta", "Pizza", "wendy's",
                               "Grilled food", "teppan yaki",
                               "Okonomiyaki", "Salmon", "cereal",
                               "Steamed chicken", "Nabe", "Chinese", "Toast"]





class ColorSetting {
    var colorSetMain: Color
    var colorSetSub: Color

    func setMainColor() -> Color {
        return colorSetMain
    }

    func setSubColor() -> Color {
        return colorSetSub
    }

    init(colorSetMain: Color, colorSetSub: Color) {
        self.colorSetMain = colorSetMain
        self.colorSetSub = colorSetSub
    }

}

struct ColorData {
    private let MAINCOLORKEYS = "MAINCOLORKEYS"
    private let SUBCOLORKEYS = "SUBCOLORKEYS"
    private var userDefaults = UserDefaults.standard

    func saveMainColor(color: Color) {
        let color = UIColor(color).cgColor
        if let components = color.components {
            userDefaults.set(components, forKey: MAINCOLORKEYS)
        }
    }

    func loadMainColor() -> Color {
        guard let array = userDefaults.object(forKey: MAINCOLORKEYS) as? [CGFloat] else {return Color.orange}
        let color = Color(.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])

        return color
    }
    
    func saveSubColor(color: Color) {
        let color = UIColor(color).cgColor
        if let components = color.components {
            userDefaults.set(components, forKey: SUBCOLORKEYS)
        }
    }

    func loadSubColor() -> Color {
        guard let array = userDefaults.object(forKey: SUBCOLORKEYS) as? [CGFloat] else {return Color.white}
        let color = Color(.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])

        return color
    }
    
}


class MenuSetting {
    var menudata: Array<String>
    
    func setMenu() -> Array<String> {
        return menudata
    }
    
    init(menudata: Array<String>) {
        self.menudata = menudata
    }
    
}

struct MenuData {
    private let MENUKEYS = "MENUKEYS"
    private let userDefaults = UserDefaults.standard
    let defaultMenuArrayKorean : Array<String>
    let defaultMenuArrayEnglish  : Array<String>
    
    init(defaultMenuArrayKorean: Array<String>, defaultMenuArrayEnglish: Array<String>) {
        self.defaultMenuArrayKorean = defaultMenuArrayKorean
        self.defaultMenuArrayEnglish = defaultMenuArrayEnglish
    }
    
    func saveMenuArray(saveArray:Array<String>) {
        let saveData = saveArray
        userDefaults.set(saveData, forKey: MENUKEYS)
    }
    
    func loadDefaultMenuArray() -> Array<String> {
        print(Language.toString())
        if Language.toString() == "한국" {
            return defaultMenuArrayKorean
            
        } else {
            print(Language.toString())
            //Language.toString() == "English"
            return defaultMenuArrayEnglish
        }
    }
    
    func loadMenuArray() -> Array<String> {
        print(Language.toString())
        if Language.toString() == "한국" {
            guard let array = userDefaults.object(forKey: MENUKEYS) as? [String]
            else {return defaultMenuArrayKorean}
            return array
            
        } else {
            //Language.toString() == "English"
            guard let array = userDefaults.object(forKey: MENUKEYS) as? [String]
            else {return defaultMenuArrayEnglish}
            return array
        }
    }
}


func searchItemWithNavermap(value: String) -> () {
    let tempString = "nmap://search?query=" + value + "&appname=UI-study.MenuDice"
    let encodedStr = tempString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let myURL = URL(string: encodedStr)!
    if UIApplication.shared.canOpenURL(myURL) {
        UIApplication.shared.open(myURL)
    } else {
        UIApplication.shared.open(naverMapappStoreURL)
    }
}

func searchItemWithAppleMap(value: String) -> () {
    let tempString = "http://maps.apple.com/?q=" + value + "&ll=" + value
    let encodedStr = tempString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let myURL = URL(string: encodedStr)!
    if UIApplication.shared.canOpenURL(myURL) {
        UIApplication.shared.open(myURL)
    } else {
        UIApplication.shared.open(naverMapappStoreURL)
    }
}

func searchItemWithKakaomap(value: String) -> () {
    //let tempString = "kakaomap://open?page=placeSearch/" + value // 잘안댐
    let tempString = "https://map.kakao.com/link/search/" + value
    let encodedStr = tempString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let myURL = URL(string: encodedStr)!
    if UIApplication.shared.canOpenURL(myURL) {
        UIApplication.shared.open(myURL)
    } else {
        UIApplication.shared.open(kakaoMapappStoreURL)
    }
}

func searchItemWithGooglemap(value: String) -> () {
    //let tempString = "kakaomap://open?page=placeSearch/" + value // 잘안댐
    let tempString = "https://www.google.com/maps/search/?api=1&query=" + value
    let encodedStr = tempString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let myURL = URL(string: encodedStr)!
    if UIApplication.shared.canOpenURL(myURL) {
        UIApplication.shared.open(myURL)
    } else {
        UIApplication.shared.open(googleMapappStoreURL)
    }
}


struct HelpMenualData {
    private let FIRSTHELPKEYS = "isFirstHelpmenual"
    private let userDefaults = UserDefaults.standard
    
    func saveIsFirstHelpMenual(boolValue: Bool) {
        let saveData = boolValue
        userDefaults.set(saveData, forKey: FIRSTHELPKEYS)
    }
    
    func loadIsFirstHelpMenual() -> Bool {
        guard let BoolData = userDefaults.bool(forKey: FIRSTHELPKEYS) as? Bool else {return false}
        
        return BoolData
    }
}


func SearchWithSelectedMapAndMenu(_ selectionOption:Int, _ menuString: String) -> () {
    if selectionOption == 0 {
        searchItemWithNavermap(value: menuString)
    } else if selectionOption == 1 {
        searchItemWithAppleMap(value: menuString)
    } else if selectionOption == 2 {
        searchItemWithKakaomap(value: menuString)
    } else if selectionOption == 3 {
        searchItemWithGooglemap(value: menuString)
    }
}
