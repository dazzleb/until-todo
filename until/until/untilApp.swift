//
//  untilApp.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

@main
struct untilApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{ //어플 내의 모든 View가 Navigation View 로 이동
                ContentView()
            }
        }
    }
}
