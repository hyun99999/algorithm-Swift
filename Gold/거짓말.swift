// 지민이가 진실로 말하거나 과장해서 말한다.
// 지민이는 거짓말쟁이가 되는 일을 피한다.
// 지민이는 모든 파티에 참가해야하고, 과장된 이야기를 할 수 있는 최댓값을 구하시오.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let truth: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 아이디어: 이야기를 아는 사람들을 같은 그룹으로 묶음
// 아는 사람이 파티에 있다면 과장된 이야기를 할 수 없다.

var parent: [Int] = Array(repeating: 0, count: nm[0] + 1)

for i in 1...nm[0] {
    parent[i] = i
}

func find(_ child: Int) -> Int {
    return parent[child] == child ? child : find(parent[child])
}

func union(_ x: Int, _ y: Int) {
    let xParent: Int = find(x)
    let yParent: Int = find(y)
    
    if xParent < yParent {
        parent[yParent] = xParent
    } else {
        parent[xParent] = yParent
    }
}

// 진실을 아는 사람끼리 묶음.
if truth[0] != 0 {
    for i in 1..<truth[0] {
        union(truth[i], truth[i + 1])
    }
}

var count: Int = 0
var party: [[Int]] = []

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    if truth[0] == 0 {
        // 진실을 아는 사람이 없음. == 모든 파티에서 거짓말 가능.
        count = nm[1]
    } else {
        party.append(input)
        
        // 파티에 참가한 사람들을 묶음.
        for i in 1..<input[0] {
            union(input[i], input[i + 1])
        }
    }
}

// 파티 목록을 다시 탐색.

for i in 0..<party.count {
    var isTruth: Bool = false
    
    for j in 1..<party[i].count {
        if find(party[i][j]) == find(truth[1]) {
            isTruth = true
            break
        }
    }
    
    if !isTruth {
        count += 1
    }
}

print(count)

/*
4 3
0
2 1 2
1 3
3 2 3 4
*/

// 답: 3
