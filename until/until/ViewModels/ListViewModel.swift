//
//  ListViewModel.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    
    
    init(){
        getItem()
    }
    func allclear() {
        items.removeAll()
    }
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
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
    
    func saveItem() {
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
}
