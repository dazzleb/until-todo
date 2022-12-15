//
//  ContentView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct ContentView: View {
    
    
    /*
     텍스트 필드에 state 값을 글로벌로 변경 해서 전체 app 이 알아차리도록 해야 할 꺼 같음
     온 커밋 시 리스트에 add
     
     check 클릭시 리스트 업데이트 
     */
    
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






