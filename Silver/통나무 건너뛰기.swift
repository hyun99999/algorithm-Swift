import Foundation

// n개의 통나무를 세워 놓고 뛰어다닌다.
// 남규는 인접한 옆 통나무로 건너뛰는데 인접한 통나무의 높이 차가 최소가 되게 하려한다.
// 통나무의 난이도는 인접한 통나무 간의 높이의 차의 최대값으로 결정된다.
// 최소 난이도를 출력.

let t: Int = Int(readLine()!) ?? 0
var answer: [Int] = []

for _ in 0..<t {
    var maxDifference: Int = 0
    let n: Int = Int(readLine()!) ?? 0
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    let sortedInput = input.sorted(by: >)
    
    // 아이디어: 통나무를 높은 순서대로 정렬한 후에 새로 정렬할 가운데부터 높은 통나무를 두면 된다.
    // 0 1 2 3 4 인덱스가 존재. 정렬하면 4 2 0 1 3. 높이 차의 최댓값을 구하기 때문에 (4,2), (2,0), (1,3) 을 계산해보면 된다.
    
    for i in 2..<n {
        maxDifference = max(maxDifference, abs(sortedInput[i] - sortedInput[i - 2]))
    }
    answer.append(maxDifference)
}

answer.forEach { print($0) }

/*
3
7
13 10 12 11 10 11 12
5
2 4 5 7 9
8
6 6 6 6 6 6 6 6

결과
1
4
0
*/
