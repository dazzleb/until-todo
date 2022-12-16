//
//  ListViewModel.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import Foundation

class ListViewModel: ObservableObject {
    
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
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        
        if let index = items.firstIndex(where:  { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
            
    }
    
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
}
