//
//  MenuDiceApp.swift
//  MenuDice
//
//  Created by yook on 2023/02/24.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

@main
struct MenuDiceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        //DispatchQueue 이용
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { _ in })
        }
    }
}
