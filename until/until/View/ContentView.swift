//
//  ContentView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [String] = [
        "와칸다 포에버!",
        "아바타 꿀잼",
        "물의 길...☃️"
    ]

    var body: some View {
        VStack {
            /// 오늘 날짜를 표현 하는 View
            TodayView()
            Spacer()
            // 오늘 할일을 적을 View
            TodoTextFieldView()
            Spacer()

                /// List view
                List{
                    ForEach(items, id: \.self) { item in
                            ListView(title: item)
                    }
                }.listStyle(PlainListStyle())
                        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}






