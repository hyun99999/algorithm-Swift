// 수직선 위의 n개 좌표
// xi 좌표를 압축한 결과는 xi보다 작은 xj 를 만족하는 서로 다른 좌표의 갯수

let n: Int = Int(readLine()!) ?? 0
let x: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var answer: [Int] = []

// MARK: - 중복되지 않는 정렬된 x.

var set: Set<Int> = []

for i in x {
    set.insert(i)
}

let sortedX: [Int] = set.sorted(by: <)

// 많은 수 중에서 순서를 찾아야 하기 때문에 이진탐색.

// 시간 복잡도 O(logN).
for i in 0..<n {
    var left: Int = 0
    var right: Int = sortedX.count
    
    while left <= right {
        let mid: Int = (left + right) / 2
        
        if sortedX[mid] < x[i] {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    answer.append(left)
}

print(answer.map { String($0) }.joined(separator: " "))

/*
5
2 4 -10 4 -9
*/

// 2 3 0 3 1
