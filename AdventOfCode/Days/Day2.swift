//
//  Day2.swift
//  AdventOfCode
//

import Foundation

let LOSS_SCORE = 0
let DRAW_SCORE = 3
let WIN_SCORE = 6

let lose: [Substring: Substring] = [
    "A": "Y",
    "B": "Z",
    "C": "X",
]

let win: [Substring: Substring] = [
    "A": "Z",
    "B": "X",
    "C": "Y",
]

let draw: [Substring: Substring] = [
    "A": "X",
    "B": "Y",
    "C": "Z",
]

let point: [Substring: Int] = [
    "X": 1,
    "Y": 2,
    "Z": 3,
]

let roundEnding: [Substring: Int] = [
    "X": 0,
    "Y": 3,
    "Z": 6,
]

func part1Solution(round: String) -> Int {
    let roundArr = round.split(separator: " ")
    let opponent = roundArr.first ?? ""
    let me = roundArr.last ?? ""
    let roundScore = lose[opponent] == me ? WIN_SCORE : draw[opponent] == me ? DRAW_SCORE : LOSS_SCORE
    return roundScore + (point[me] ?? 0)
}

func part2Solution(round: String) -> Int {
    let roundArr = round.split(separator: " ")
    let opponent = roundArr.first ?? ""
    let me = roundArr.last ?? ""
    guard let roundEnding = roundEnding[me] else {
        return 0
    }
    var roundScore = 0
    
    switch(roundEnding) {
    case 0:
        guard let myChoose = win[opponent] else {
            return 0
        }
        roundScore = (point[myChoose] ?? 0) + roundEnding
        
    case 3:
        guard let myChoose = draw[opponent] else {
            return 0
        }
        roundScore =  (point[myChoose] ?? 0) + roundEnding
        
    default:
        guard let myChoose = lose[opponent] else {
            return 0
        }
        roundScore = (point[myChoose] ?? 0) + roundEnding
    }
    return roundScore
}

final class Day2: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let arrayInput = input.split(separator: "\n")
        return arrayInput.reduce(0) {pointsSum, round in
            let roundPoints = part1Solution(round: String(round))
            return pointsSum + roundPoints
        }
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let arrayInput = input.split(separator: "\n")
        return arrayInput.reduce(0) {pointsSum, round in
            let roundPoints = part2Solution(round: String(round))
            return pointsSum + roundPoints
        }
    }
}
