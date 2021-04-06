//
//  main.swift
//  algorithmPlayground
//
//  Created by kimhyungyu on 2021/04/03.
//

import Foundation

func binarySearch(_ array: [Int], num: Int) -> Bool {
    if array.count == 1 {
        return array[0] == num ? true : false
    }
    let mid = array.count / 2
    let range = array[mid] < num ? (0..<mid) : ((mid + 1)..<array.count)
    
    return binarySearch(Array(array[range]), num: num)
}


let array = [1, 4, 6, 8, 3]
let a = binarySearch(array, num: 6)
print(a)
