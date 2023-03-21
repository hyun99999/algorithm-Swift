import Foundation

// V개의 마을과 E개의 도로로 구성되어있는 도시.
// 도로는 마을과 마을 사이에 놓임. 일방통행이다.
// 도로를 따라서 운동을 하고 다시 시작점을 돌아오기 때문에 사이클을 찾기 원한다.
// 단, 사이클을 이루는 도로의 길이의 합이 최소.

let ve: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
/// 마을의 갯수. 1~v.
let v: Int = ve[0]
/// 도로의 갯수.
let e: Int = ve[1]

var edges: [[Int]] = Array(repeating: Array(repeating: Int.max, count: v + 1), count: v + 1)

for _ in 0..<e {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
    
    edges[input[0]][input[1]] = min(input[2], edges[input[0]][input[1]])
}

// 아이디어: edges[i][i] 중에서 가장 짧은 도로 길이의 합을 출력. 불가능한 경우 -1 출력.
// 최단거리. 모든 노드에서 모든 노드. 도시의 갯수는 최대 400개.
// 플로이드 워셜.

for i in 1...v {
    for start in 1...v {
        for end in 1...v {
            if edges[start][i] != Int.max && edges[i][end] != Int.max {
                edges[start][end] = min(edges[start][end], edges[start][i] + edges[i][end])
            }
        }
    }
}

var answer: Int = Int.max

for i in 1...v {
    answer = min(edges[i][i], answer)
}

print(answer == Int.max ? -1 : answer)
