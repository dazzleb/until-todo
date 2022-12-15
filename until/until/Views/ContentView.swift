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
    
    @State var items: [ItemModel] = [
        ItemModel(title: "오늘 할일은 말이죠 ", isCompleted: false),
        ItemModel(title: "클리어!", isCompleted: true)
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
                    ForEach(items) { item in
                        ListView(item: item)
                    }.onDelete(perform: deleteItem)
                        .onMove(perform: moveItem)
                }.listStyle(PlainListStyle())
                
                        
        }.navigationBarItems(trailing: EditButton())
        .padding()
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}






