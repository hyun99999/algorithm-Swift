// 학생이 n명인 학교에 입학했다. 준석이는 친구비를 주어서 모든 학생과 친구가 되고 싶다.
// 학생i 에게 ai만큼의 돈을 주면 1달간 친구가 되어준다.
// 준석이에게는 총 k원의 돈이 있다.
// 친구의 친구에게는 돈을 주지 않아도 친구다.
// 가장 적은 비용으로 모든 사람과 친구가 되는 방법은?
// 다 사귈 수 없다면 On no 를 출력한다.

/// n: 학생 수
/// m: 친구 관계 수
/// k: 가진 돈
let nmk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
let a: [Int] = [0] + readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var parent: [Int] = Array(Range(0...n))
var cost: Int = 0

// 입력: v w
// 학생 v와 학생 w 는 서로 친구다.

// MARK: - 아이디어: union-find. 최소 비용의 노드를 선택해야함.

// union-find

func find(_ a: Int) -> Int {
    return parent[a] == a ? a : find(parent[a])
}

func union(x: Int, y: Int) {
    let xParent = find(x)
    let yParent = find(y)
    
    if xParent == yParent { return }
    
    // ✅ 친구비가 작은 쪽으로 부모 설정.
    // 🚨 이때 부모 친구비를 계산해야 함.
    if a[xParent] < a[yParent] {
        parent[yParent] = xParent
    } else {
        parent[xParent] = yParent
    }
}

for _ in 0..<m {
    let inputs: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    union(x: inputs[0], y: inputs[1])
}

var set: Set<Int> = []

for i in 1...n {
    set.insert(find(parent[i]))
}

set.forEach {
    cost += a[$0]
}

if cost > k {
    print("Oh no")
} else {
    print(cost)
}

/*
5 3 20
10 10 20 20 30
1 3
2 4
5 4
*/

// 20
