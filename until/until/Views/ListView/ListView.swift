//
//  ListView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct ListView: View {
     let title: String
    var body: some View {
        HStack{
            ZStack{
                CheckView()
                CheckMarkView()
                }
                .frame(width: 31, height: 30)
                .shadow(color: Color.primary.opacity(0.14), radius: 3, x:2, y:5)
            Text("아무것도 몰라요 몰라 몰라 진짜 몰라요 ")
            Spacer()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(title: "나도 몰라유~")
    }
}


