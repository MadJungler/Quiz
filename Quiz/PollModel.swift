//
//  PollModel.swift
//  Quiz
//
//  Created by Павел on 16.08.2022.
//

import Foundation

struct PollModel {
    let name: String
    let questions: [QuestionModel]
}

struct QuestionModel {
    let title: String
    let variants: [String]
    let answer: String
}

class PollStorage {
    let polls = [
        PollModel(
            name: "Animal",
            questions: [
                QuestionModel(
                    title: "Сколько ног у кота",
                    variants: ["Одна", "Четыре"],
                    answer: "Четыре"
                ),
                QuestionModel(
                    title: "Сколько ног у кота",
                    variants: ["Одна", "Четыре"],
                    answer: "Четыре"
                )

            ]
        ),
        PollModel(
            name: "Animal",
            questions: [
                QuestionModel(
                    title: "Сколько ног у кота",
                    variants: ["Одна", "Четыре"],
                    answer: "Четыре"
                ),
                QuestionModel(
                    title: "Сколько ног у кота",
                    variants: ["Одна", "Четыре"],
                    answer: "Четыре"
                )

            ]
        )
    ]
}
