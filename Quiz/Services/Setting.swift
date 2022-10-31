//
//  Setting.swift
//  Quiz
//
//  Created by Павел on 30.10.2022.
//

import Foundation

class Setting {
    static let shared = Setting()
    private (set) var isRandomOrder: Bool
    private init() {
        isRandomOrder = false
    }
    
    func setOrder(isRandom: Bool) {
        isRandomOrder = isRandom
    }
}
