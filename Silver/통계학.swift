// N은 홀수라고 가정.
// 산술평균, 중앙값, 최빈값, 범위
// 를 구하는 프로그램을 작성하시오.

import Foundation

/// 1이상. 500,000 이하.
let n: Int = Int(readLine()!) ?? 0

var list: [Int] = []

var sum: Int = 0
var dictionary: [Int: Int] = [:]

for _ in 0..<n {
    let input: Int = Int(readLine()!) ?? 0
    
    list.append(input)
    sum += input
    dictionary[input, default: 0] += 1
}

// 산술 평균(반올림)
print(Int(round(Double(sum) / Double(list.count))))

list.sort(by: <)
// 중앙값
print(list[n / 2])

// 최빈값
let sortedDictionary: [Dictionary<Int, Int>.Element] = dictionary.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    } else {
        return $0.value > $1.value
    }
}

if sortedDictionary.count > 1 {
    if sortedDictionary[0].value == sortedDictionary[1].value {
        print(sortedDictionary[1].key)
    } else {
        print(sortedDictionary[0].key)
    }
} else {
    print(sortedDictionary[0].key)
}

// 범위
print(list.max()! - list.min()!)

/*
5
1
3
8
-2
2
*/

