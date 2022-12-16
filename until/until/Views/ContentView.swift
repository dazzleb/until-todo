//
//  ContentView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
 
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
                    ForEach(listViewModel.items) { item in
                        ListView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                     .onDelete(perform: listViewModel.deleteItem) // Delete
                     .onMove(perform: listViewModel.moveItem) // Edit
                }.listStyle(PlainListStyle())
                
                        
        }.navigationBarItems(trailing: EditButton()) // Edit Button
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
                
        }.environmentObject(ListViewModel())
        //미리보기 에서는 환경객체가 없어서 보이지 않으니 추가해두었다. untilApp 자체에서는 환경객체를 주고 있기 때문에 없어도 러닝 할 때는 볼 수 있다.
    }
}






