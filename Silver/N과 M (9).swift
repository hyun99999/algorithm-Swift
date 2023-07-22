// n개의 자연수와 자연수 m
// n개의 자연수 중에서 m개를 고른 수열을 작성.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var nList: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }.sorted(by: <)
var answer: [[Int]] = []
var visited: [Bool] = Array(repeating: false, count: nm[0])

// 순열.

func permutation(_ arr: [Int], _ count: Int) {
    // 종료 조건.
    if count == nm[1] {
        // 🚨 시간초과.
//        if !answer.contains(arr) {
            answer.append(arr)
//        }
        
        return
    }
    
    // nList 는 오름차순 정렬되어 있고, 같은 숫자를 선택할 때(연속된 인덱스에 놓여짐) 중복 될 수 있기 때문에 해당 분기처리에서 걸러준다.
    // Ex. nList = [0, 1, 1, 3]
    // 1을 고른 후, 다음 for 문에서 1을 또다시 고르지 않도록 할 수 있음.
    var preNumber: Int = 0
    
    for i in 0..<nList.count {
        if !visited[i] &&
        // 🚨 시간초과 해결을 위함
        preNumber != nList[i] {
            preNumber = nList[i]
            visited[i] = true
            permutation(arr + [nList[i]], count + 1)
            visited[i] = false
        }
    }
}

permutation([], 0)

answer.forEach { print($0.map { String($0) }.joined(separator: " ")) }

/*
 4 2
 9 7 9 1
 */

/*
 1 7
 1 9
 7 1
 7 9
 9 1
 9 7
 9 9
 */
