//
//  LanguageSettingView.swift
//  MenuDice
//
//  Created by yook on 2023/03/19.
//

import SwiftUI

struct LanguageSettingView: View {
    private let Language: LocalizedStringKey = "Language"

    var body: some View {
        Text(Language)
    }
}

struct LanguageSettingView_Previews: PreviewProvider {
    private let title: LocalizedStringKey = "Language"
    static var previews: some View {
        LanguageSettingView()
    }
}

extension LocalizedStringKey {

    /**
     Return localized value of thisLocalizedStringKey
     */
    public func toString() -> String {
        //use reflection
        let mirror = Mirror(reflecting: self)
        
        //try to find 'key' attribute value
        let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
            let (label, _) = arg0
            if(label == "key"){
                return true;
            }
            return false;
        }
        
        if(attributeLabelAndValue != nil) {
            //ask for localization of found key via NSLocalizedString
            return String.localizedStringWithFormat(NSLocalizedString(attributeLabelAndValue!.value as! String, comment: ""));
        }
        else {
            return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
        }
    }
}
