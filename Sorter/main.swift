//
//  main.swift
//  Sorter
//
//  Created by William Koehler on 29.10.17.
//  Copyright © 2017 William Koehler. All rights reserved.
//Parameters may not have the 'var' specifier

import Foundation

func check(subject: inout [Int]) {
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
}

func bubblesort(subject: inout [UInt32]) {
    print("bubble sorting...")
    for iteration in (1..<subject.count-1).reversed() {
        for index in (0...iteration) {
            if (subject[index] > subject[index+1]) {
                let temp = subject[index]
                subject[index] = subject[index+1]
                subject[index+1] = temp
                //print("bubble sorting: \(subject)")
            }
        }
    }
    print("bubble sorted: \(subject)")
}

func quicksort(subject: inout [UInt32]) {
    print("init quicksort: \(subject)")
    _quicksort(subject: &subject, start: 0, end: subject.count-1)
}

func _quicksort(subject: inout [UInt32], start: Int, end: Int) {
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
    mergesortSplit(subject: &subject, startA: 0, endB: subject.count - 1)
}

func mergesortSplit(subject: inout [Int], startA: Int, endB: Int) {
    //print("merge sorting - split: \(startA) \(endB)")
    if (endB-startA) > 0 {
        let split = (endB + startA) / 2
        mergesortSplit(subject: &subject, startA: startA, endB: split)
        mergesortSplit(subject: &subject, startA: split +  1, endB: endB)
        mergesortJoin(subject: &subject, startA: startA, endA: split, endB: endB)
        //print("merge sorting: \(subject)")
    }
}

func mergesortJoin(subject: inout [Int], startA: Int, endA: Int, endB: Int) {
    //print("merge sorting - joining: \(startA) \(endA) \(endB)")
    var indexA = startA
    var indexB = endA + 1
    let partial = subject[startA...endB]
    print("merge sorting - partial: \(partial)")
    for index in (startA...endB) {
        if indexB > endB || (endA >= indexA && partial[indexA] < partial[indexB]) {
            //print("merge sorting - check: \(indexB > endB) \(endA > indexA) \(partial[indexA] < partial[indexB])  \(partial[indexA])  \(partial[indexB])")
            //print("merge sorting - joining A: \(partial[indexA]) \(index)")
            subject[index] = partial[indexA]
            indexA = indexA + 1
        } else {
            //print("merge sorting - check: \(indexB > endB) \(endA > indexA) \(subject[indexA] < subject[indexB])  \(subject[indexA])  \(subject[indexB])")
            //print("merge sorting - joining B: \(partial[indexB]) \(index)")
            subject[index] = partial[indexB]
            indexB = indexB + 1
        }
        //print("merge sorting - partial: \(partial)")
        print("merge sorting - subject: \(subject)")
    }
}

print("getting started...")
var subject = (1...(10 + arc4random() % 11)).map{_ in Int(arc4random() % 50)}
//var subject = [47, 16, 0, 7, 14, 46, 43, 8]
print("subject: \(subject)")
check(subject: &subject)
mergesort(subject: &subject)
check(subject: &subject)
