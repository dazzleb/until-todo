//
//  untilApp.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI
import GoogleMobileAds
@main
struct untilApp: App {
    // ADMob 초기화
    init() {
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    // body 안에서는 안됨
    
    /// 해당 객체가 변화가 있다면 앱이 재작동 ( 상위 뷰 이기에 StateObject )
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{ //어플 내의 모든 View가 Navigation View 로 이동
                ContentView()
                .preferredColorScheme(.light) // Force to .light mode
                    
            }.accentColor(.orange)
                .environmentObject(listViewModel)
        }
    }
}
