//
//  TodoTextFieldView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct TodoTextFieldView: View {
    @State var textFieldText: String = ""
    var body: some View {
        
        VStack{
            HStack(spacing: 5){
                Text("🔥")
                    .font(.title)
                TextField("이곳에 오늘 할일 을 입력해주세요.",
                          text: $textFieldText,
                          onCommit:{
                    
                }).disableAutocorrection(true)
                    .underline()
                    .font(.headline)
            }.padding(.leading, 40)
        }.padding(16)
        

    }
}

struct TodoTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTextFieldView()
    }
}
