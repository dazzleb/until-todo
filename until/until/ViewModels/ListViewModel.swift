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
    
    /// 전체 삭제
    func allclear() {
        items.removeAll()
    }
    /// 유저 디폴츠에 데이터 불러오기
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
    }
    /// 요소 추가
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    /// 업데이트
    func updateItem(item: ItemModel){
        
        if let index = items.firstIndex(where:  { $0.id == item.id }) {
            // 모델 업데이트
            items[index] = item.updateCompletion()
        }
            
    }
    /// 요소 유저 디폴츠에 저장
    func saveItem() {
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    /// 요소 삭제
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    /// 요소 이동
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
}
