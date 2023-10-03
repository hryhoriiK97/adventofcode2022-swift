//
//  Day3.swift
//  AdventOfCode
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func getItemPriority(for character: Character) -> Int {
    let asciiValue = Int(character.asciiValue!)
    if asciiValue >= 97 {
        return asciiValue - 96
    } else if asciiValue >= 64 {
        return asciiValue - 38
    } else {
        fatalError()
    }
}

final class Day3: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let rucksaks = input.split(separator: "\n")
        return rucksaks.reduce(0) { priority, rucksack in
            let firstCompartments = Set(rucksack.prefix(rucksack.count / 2).map { $0 })
            let secondCompartments = Set(rucksack.suffix(rucksack.count / 2).map { $0 })
            let commonTypeItems = firstCompartments.intersection(secondCompartments)
            return priority + getItemPriority(for: commonTypeItems.first! as Character)
        }
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let rucksaks = input.split(separator: "\n")
        return rucksaks.chunked(into: 3).reduce(0) { priority, rucksaksGroup in
            let sets = rucksaksGroup.map { Set($0.map { $0 }) }
            let common = sets[0].intersection(sets[1]).intersection(sets[2])
            return priority + getItemPriority(for: common.first!)
        }
    }
}
