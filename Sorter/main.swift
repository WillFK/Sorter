//
//  main.swift
//  Sorter
//
//  Created by William Koehler on 29.10.17.
//  Copyright © 2017 William Koehler. All rights reserved.
//Parameters may not have the 'var' specifier

import Foundation

func bubbleSort( subject: inout [UInt32]) {
    
    print("bubble sorting...")
    for iteration in (1..<subject.count-1).reversed() {
        for index in (0...iteration) {
            if (subject[index] > subject[index+1]) {
                let temp = subject[index]
                subject[index] = subject[index+1]
                subject[index+1] = temp
                print("bubble sorting: \(subject)")
            }
        }
    }
}

print("getting started...")
var subject = (1...10).map{_ in arc4random() % 50}
print("subject: \(subject)")
bubbleSort(subject: &subject)
