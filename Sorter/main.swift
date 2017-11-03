//
//  main.swift
//  Sorter
//
//  Created by William Koehler on 29.10.17.
//  Copyright © 2017 William Koehler. All rights reserved.
//Parameters may not have the 'var' specifier

import Foundation

func check(subject: inout [UInt32]) {
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

func bubbleSort(subject: inout [UInt32]) {
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

func quickSort(subject: inout [UInt32]) {
    print("init quicksort: \(subject)")
    _quickSort(subject: &subject, start: 0, end: subject.count-1)
}

func _quickSort(subject: inout [UInt32], start: Int, end: Int) {
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
        _quickSort(subject: &subject, start: start, end: pos-1)
        _quickSort(subject: &subject, start: pos+1, end: end)
    }
}

print("getting started...")
var subject = (1...10).map{_ in arc4random() % 50}
print("subject: \(subject)")
check(subject: &subject)
quickSort(subject: &subject)
check(subject: &subject)
