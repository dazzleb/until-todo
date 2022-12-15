//
//  ItemModel.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import Foundation
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
