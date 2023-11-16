// n개의 벽장들이 일렬로 붙어있고 벽장의 문은 n-2개만 있다.
// 벽장 앞에 있는 문은 이웃 벽장 앞에 문이 없다면 움직일 수 있다.
// 벽장 문은 이웃 벽장이 열려있다면 한 칸씩 이동할 수 있다.

// 사용할 벽장이 입력으로 주어짐. 벽장문을 이동하는 최소 순서를 찾으시오.

/// 벽장의 개수
let doorCount: Int = Int(readLine()!) ?? 0
/// 열려있는 벽장의 번호. 2개.
let open: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
/// 사용할 벽장들의 개수
let usedDoor: Int = Int(readLine()!) ?? 0
/// 사용할 벽장의 번호
var used: [Int] = []

for _ in 0..<usedDoor {
    let input: Int = Int(readLine()!) ?? 0
    used.append(input)
}

// dfs
// 브루트포스 알고리즘

var minCount: Int = Int.max

func dfs(firstOpen: Int, secondOpen: Int, depth: Int, count: Int) {
    if depth == usedDoor {
        minCount = min(minCount, count)
        return
    }
    
    // 🚨 비어있는 두 개의 벽장 모두를 대상으로 dfs.
    dfs(firstOpen: used[depth], secondOpen: secondOpen, depth: depth + 1, count: count + abs(firstOpen - used[depth]))
    dfs(firstOpen: firstOpen, secondOpen: used[depth], depth: depth + 1, count: count + abs(secondOpen - used[depth]))
}

dfs(firstOpen: open[0], secondOpen: open[1], depth: 0, count: 0)

print(minCount)

/*
 7
 2 5
 4
 3
 1
 6
 5
 */

// 답5
