//
//  TodoTextFieldView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct TodoTextFieldView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    var title: String = "이곳에 오늘 할일 을 적어보세요."
    var body: some View {
        
        VStack{
            HStack(spacing: 5){
                Text("🔥")
                    .font(.title)
                TextField("\(title)",
                          text: $textFieldText,
                          
                          onCommit:{ addItem()
                    // return 하면 발동 : 리스트 추가
                })
                    .disableAutocorrection(true)
                    .underline()
                    .font(.headline)
            }.padding(.leading, 40)
        }.padding(16)
        

    }
    func addItem() {
        listViewModel.addItem(title: textFieldText)
            Task {
                textFieldText = ""
            }
    }
}

struct TodoTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTextFieldView()
        .environmentObject(ListViewModel())
    }
}
