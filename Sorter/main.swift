//
//  main.swift
//  Sorter
//
//  Created by William Koehler on 29.10.17.
//  Copyright © 2017 William Koehler. All rights reserved.
//Parameters may not have the 'var' specifier

import Foundation

func getSubjects() -> [[Int]] {
    var subjects = [[Int]]()
    subjects.append([Int](0...9))
    subjects.append([Int](0...9).reversed())
    for _ in (0...18) {
        subjects.append((0...(9 + arc4random() % 5)).map{_ in Int(arc4random() % 50)})
    }
    return subjects
}

func check(subject: inout [Int]) -> Bool {
    var last = subject[0]
    var sorted = true
    for index in 1..<subject.count {
        if (subject[index] < last) {
            sorted = false
            break
        }
        else {
            last = subject[index]
        }
    }
    if sorted {
        print("sorted")
    } else {
        print("not sorted")
    }
    return sorted
}

func bubblesort(subject: inout [Int]) {
    print("bubblesorting \(subject)")
    for iteration in (0..<subject.count-1).reversed() {
        for index in (0...iteration) {
            if (subject[index] > subject[index+1]) {
                let temp = subject[index]
                subject[index] = subject[index+1]
                subject[index+1] = temp
            }
        }
    }
    print("bubblesorted: \(subject)")
}

func quicksort(subject: inout [Int]) {
    print("quicksorting: \(subject)")
    _quicksort(subject: &subject, start: 0, end: subject.count-1)
    print("quicksorted: \(subject)")
}

func _quicksort(subject: inout [Int], start: Int, end: Int) {
    if end > start {
        var pos = start
        for index in (start+1...end) {
            print("quick sorting - comparing : \(subject[start]) X \(subject[index])")
            if subject[index] < subject[start] {
                pos = pos+1
                let temp = subject[index]
                subject[index] = subject[pos]
                subject[pos] = temp
                print("quick sorting: \(subject)")
            }
        }
        let temp = subject[start]
        subject[start] = subject[pos]
        subject[pos] = temp
        print("quick sorting: \(subject)")
        _quicksort(subject: &subject, start: start, end: pos-1)
        _quicksort(subject: &subject, start: pos+1, end: end)
    }
}

func mergesort(subject: inout [Int]) {
    print("mergesorting: \(subject)")
    mergesortSplit(subject: &subject, startA: 0, endB: subject.count - 1)
    print("mergesorted: \(subject)")
}

func mergesortSplit(subject: inout [Int], startA: Int, endB: Int) {
    if (endB-startA) > 0 {
        let split = (endB + startA) / 2
        mergesortSplit(subject: &subject, startA: startA, endB: split)
        mergesortSplit(subject: &subject, startA: split +  1, endB: endB)
        mergesortJoin(subject: &subject, startA: startA, endA: split, endB: endB)
    }
}

func mergesortJoin(subject: inout [Int], startA: Int, endA: Int, endB: Int) {
    var indexA = startA
    var indexB = endA + 1
    let partial = subject[startA...endB]
    for index in (startA...endB) {
        if indexB > endB || (endA >= indexA && partial[indexA] < partial[indexB]) {
            subject[index] = partial[indexA]
            indexA = indexA + 1
        } else {
            subject[index] = partial[indexB]
            indexB = indexB + 1
        }
    }
}

print("getting started...")
let subjects = getSubjects()
for subject in subjects {
    var copy = subject
    bubblesort(subject: &copy)
    if !check(subject: &copy) {
        break
    }
}
for subject in subjects {
    var copy = subject
    quicksort(subject: &copy)
    if !check(subject: &copy) {
        break
    }
}
for subject in subjects {
    var copy = subject
    mergesort(subject: &copy)
    if !check(subject: &copy) {
        break
    }
}
