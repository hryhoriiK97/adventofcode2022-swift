//
//  Day1.swift
//  AdventOfCode
//

import Foundation

func parseInputToElvesStocks(input: String) -> [[Int]] {
    input.split(separator: "\n\n").lazy.map { section in
        section.split(separator: "\n").lazy.compactMap {  elfCalories in
            Int(elfCalories)
        }
    }
}

func calculateHighestTotalCalories(elvesStocks: [[Int]]) -> Int {
    elvesStocks.lazy.reduce(0) { maxTotal, elfStock in
        let currentTotal = elfStock.reduce(0, +)
        return max(maxTotal, currentTotal)
    }
}

func calculateTotalCaloriesForThreeElves(elvesStocks: [[Int]]) -> Int {
    elvesStocks.lazy.map { stockPerElf in
        stockPerElf.reduce(0, +)
    }.lazy.sorted(by: >).prefix(3).reduce(0, +)
}


final class Day1: Day {
    
    func part1(_ input: String) -> CustomStringConvertible {
        let elvesStocks = parseInputToElvesStocks(input: input)
        
        let highestCaloriesTotal = calculateHighestTotalCalories(elvesStocks: elvesStocks)
        
        return highestCaloriesTotal;
    }


    func part2(_ input: String) -> CustomStringConvertible {
        let elvesStocks = parseInputToElvesStocks(input: input)
        
        let caloriesTotalPerThreeElves = calculateTotalCaloriesForThreeElves(elvesStocks: elvesStocks)
        
        return caloriesTotalPerThreeElves
    }
}
