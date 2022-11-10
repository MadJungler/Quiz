//
//  +DateFormatter.swift
//  Quiz
//
//  Created by Павел on 10.11.2022.
//

import Foundation

extension DateFormatter {
    
    static let defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU_ru")
        dateFormatter.dateFormat = "dd,MM,y HH:mm"
        return dateFormatter
    }()
}
