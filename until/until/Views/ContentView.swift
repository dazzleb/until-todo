//
//  ContentView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    //Action alert
    @State var showingSheet = false
 //MARK: BODY
    var body: some View {
        VStack {
            /// 오늘 날짜를 표현 하는 View
            TodayView()
            Spacer()
            // 오늘 할일을 적을 View
            VStack{
                TodoTextFieldView()
                Spacer()
                //MARK: 리스트
               if listViewModel.items.isEmpty {
                   /// 아이템이 존재하지 않을 때
                    VStack{
                        //ca-app-pub-5125834714357837/1392130842
                        //ca-app-pub-3940256099942544/2934735716 (Sample)
                    Spacer(minLength: 250)
                    Text("✍🏻 오늘까지 해야 할 일을 적어보세요!")
                     .font(.title3)
                     .foregroundColor(.brown)
                      .lineLimit(nil)
                            }
                   Spacer(minLength: 250)
                   VStack{
                       BannerAd(unitID: "ca-app-pub-5125834714357837/1392130842")
                   }
                    
                }else {
                    /// 아이템이 존재 
                    List{
                        ForEach(listViewModel.items) { item in
                            LazyVStack{
                                
                                ListView(item: item)
                                
                                    .onTapGesture {
                                        withAnimation(.linear){
                                            listViewModel.updateItem(item: item)
                                        }
                                    }
                                
                            }.listRowSeparator(.hidden)
                        }
                         .onDelete(perform: listViewModel.deleteItem) // Delete
                         .onMove(perform: listViewModel.moveItem) // Edit
                    }.listStyle(PlainListStyle())
                }
            }
        }
        //MARK: 바 아이템
        .navigationBarItems(leading:
                                Button {
                                    //clear()
                                    self.showingSheet = true
                                } label: {
                                    Text("All Clear")
                                }.confirmationDialog(
                                    "리스트 전체 삭제 할까요?",
                                    isPresented: $showingSheet) {
                                    Button("전체 삭제", role:  .destructive, action: clear)
                                    Button("취소", role: .cancel) {}
                                  }message: {
                                      Text("리스트 를 전체 삭제 할까요?")
                                    },
                             trailing:
                                    EditButton()
                                )
                                .padding()
    }
//MARK: 함수
    func clear(){
        listViewModel.allclear()
    }
}
//MARK: 미리보기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
                
        }.environmentObject(ListViewModel())
        //미리보기 에서는 환경객체가 없어서 보이지 않으니 추가해두었다. untilApp 자체에서는 환경객체를 주고 있기 때문에 없어도 러닝 할 때는 볼 수 있다.
    }
}






