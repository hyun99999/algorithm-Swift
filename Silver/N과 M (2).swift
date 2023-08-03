// 1부터n까지 자연수 중에서 중복 없이 m개를 고른 수열
// 오름차순

// 조합

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var answer: [[Int]] = []

func combination(_ start: Int, _ arr: [Int], _ count: Int) {
    if count == nm[1] {
        answer.append(arr)
        
        return
    }
    
    for i in start..<nm[0] {
        combination(i + 1, arr + [i + 1], count + 1)
    }
}

for i in 1...nm[0] {
    combination(i, [i], 1)
}


answer.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}

// 4 2

/*
 1 2
 1 3
 1 4
 2 3
 2 4
 3 4
*/
