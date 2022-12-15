//
//  ListViewModel.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import Foundation
class ListViewModel {
    @Published var items: [ItemModel] = []
    
    init(){
        getItem()
    }
    
    func getItem() {
        let newItems = [
            ItemModel(title: "오늘 할일은 말이죠 ", isCompleted: false),
            ItemModel(title: "클리어!", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    
    
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
}
