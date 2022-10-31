//
//  PollModel.swift
//  Quiz
//
//  Created by Павел on 16.08.2022.
//

import Foundation

struct PollModel {
    let name: String
    var questions: [QuestionModel]
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
                    title: "Как по английски будет жаба?",
                    variants: ["Chipmunk", "Frog", "Hedgehog", "Otter"],
                    answer: "Frog"
                ),
                QuestionModel(
                    title: "Как по английски будет носорог?",
                    variants: ["Elk", "Capybara", "Hippopotamus", "Rhinoceros"],
                    answer: "Rhinoceros"
                )

            ]
        ),
        PollModel(
            name: "Food",
            questions: [
                QuestionModel(
                    title: "Как по английски будет морковка?",
                    variants: ["Grape", "Peach", "Carrot", "Broccoli"],
                    answer: "Carrot"
                ),
                QuestionModel(
                    title: "Как по английски будет ананас?",
                    variants: ["Apple", "Pineapple", "Pear", "Banana"],
                    answer: "Pineapple"
                )

            ]
        ),
        PollModel(
            name: "Transport",
            questions: [
                QuestionModel(
                    title: "Как по английски будет мотоцикл",
                    variants: ["Bicycle", "Helicopter", "Quadrocopter", "Motorcycle"],
                    answer: "Motorcycle"
                ),
                QuestionModel(
                    title: "Как по английски будет грузовик?",
                    variants: ["Rickshaw", "Truck", "Paroplane", "Bus"],
                    answer: "Truck"
                )

            ]
        )
    ]
}
