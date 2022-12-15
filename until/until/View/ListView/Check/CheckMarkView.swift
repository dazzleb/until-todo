//
//  CheckMarkView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct CheckMarkView: View {
    var body: some View {
        Image(systemName: "checkmark")
            .fontWeight(.bold)
            .foregroundColor(.orange).opacity(0.7)
    }
}

struct CheckMarkView_Previews: PreviewProvider {
    static var previews: some View {
        CheckMarkView()
    }
}
