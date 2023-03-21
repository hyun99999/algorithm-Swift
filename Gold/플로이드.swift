import Foundation

// n개의 도시가 있다. 한 도시에서 출발하여 다른 도시로 도착하는 m개의 버스가 있다.
// 2<= n <=100 / 1<= m <= 100,000
// 버스는 한번 사용할때 비용 존재.
// 모든 도시에 대해서 a에서 b로 가는 최소 비용 구하기.


// 아이디어: 최단거리.
// 플로이드 워셜 : 모든 도시에서 모든 도시. 삼중 for문. 2차원 배열.

/// 도시의 개수.
let n: Int = Int(readLine()!) ?? 0
/// 버스의 개수.
let m: Int = Int(readLine()!) ?? 0

// 모든 버스에 대해서 경로 설정.
var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)

for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
    
    graph[input[0]][input[1]] = min(graph[input[0]][input[1]], input[2])
}

for index in 0...n {
    graph[index][index] = 0
}

for i in 1...n {
    for start in 1...n {
        for end in 1...n {
            if graph[start][i] != Int.max && graph[i][end] != Int.max {
                graph[start][end] = min(graph[start][end], graph[start][i] + graph[i][end])
            }
        }
    }
}

// 🚨 Int.max 인 경우를 0으로 바꾸어주지 않아서 출력초과.
for row in 1...n {
    for col in 1...n {
        if graph[row][col] == Int.max {
            graph[row][col] = 0
        }
    }
}

for row in 1...n {
    for col in 1...n {
        print(graph[row][col], terminator: " ")
    }
    print()
}

/*
5
14
1 2 2
1 3 3
1 4 1
1 5 10
2 4 2
3 4 1
3 5 1
4 5 3
3 5 10
3 1 8
1 4 2
5 1 7
3 4 2
5 2 4

결과
0 2 3 1 4
12 0 15 2 5
8 5 0 1 1
10 7 13 0 3
7 4 10 6 0
*/
