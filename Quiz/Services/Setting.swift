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
    private (set) var results: [ResultModel]
    private init() {
        isRandomOrder = false
        results = []
    }
    
    func setOrder(isRandom: Bool) {
        isRandomOrder = isRandom
    }
    
    func newResult(_ newResult: ResultModel) {
        results.append(newResult)
    }
 }
