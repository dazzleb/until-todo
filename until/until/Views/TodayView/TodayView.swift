//
//  TodayView.swift
//  until
//
//  Created by 시혁 on 2022/12/15.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        
        let today = Date()
        ///날짜 표기 형식
        let dateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY년 M월 d일"
            return formatter
            }()
        
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 30).fill(Color.clear).frame(width: 320, height: 40)
                HStack{
                    Text("\(today, formatter: dateFormat)")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.brown)
                        .font(.largeTitle)
                }
            }
            
        }
        .frame(height: 50)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
