//
//  ListView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct ListView: View {
     let item: ItemModel
    var body: some View {
        HStack{
            /// Check
            ZStack{
                if item.isCompleted {
                    CheckView()
                    CheckMarkView()
                }else {
                    CheckView()
                    }
                }
                .frame(width: 31, height: 30)
                .shadow(color: Color.primary.opacity(0.14), radius: 3, x:2, y:5)
            
            /// Text
            if item.isCompleted{
                Text("\(item.title)")
                    .font(.title3)
                    .strikethrough()
                    .foregroundColor(Color.gray)
                    .padding(.vertical, 8)
            }else{
                Text("\(item.title)")
                    
                    .font(.title2)
                    .padding(.vertical, 8)
            }

            Spacer()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "안녕하세요.", isCompleted: true)
    static var item2 = ItemModel(title: "Hello.", isCompleted: false)
    
    static var previews: some View {
        Group{
            ListView(item: item1)
            ListView(item: item2)
        }.previewLayout(.sizeThatFits)
        
    }
}


