import Foundation

// n*n 크기의 공간에 물고기 m마리. 아기 상어1마리.
// 한칸에 물고기는 최대1마리
// 처음에 아기 상어는 크기 2. 아기 상어는 1초에 상하좌우로 한 칸씩 이동.
// 아기 상어는 자기보다 큰 물고기가 있는 칸은 지날 수 없고, 자신의 크키보다 작은 물고기만 먹을 수 있다.
// 크기가 같은 물고기는 먹을 수 없지만 지나갈 수 있다.

// 더 이상 먹을 수 있는 물고기가 공간에 없다면 엄마 상어에게 도움을 청함.
// 먹을 수 있는 물고기가 1마리보다 많다면, 거리가 가장 가까운 물고기를 먹음
// 아기상어는 자기 크기만큼 물고기를 먹으면 1 증가.

// 엄마 상어에게 도움을 요청하지 않고 물고기를 잡아먹을 수 있는 시간을 구하시오.

let n: Int = Int(readLine()!) ?? 0
var graph: [[Int]] = Array(repeating: [], count: n)

// 공간의 상태는 0(빈 칸),1,2,3,4,5,6(물고기의 크기),9(아기 상어의 위치)
for index in 0..<n {
    graph[index] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
}

// 아이디어: 현재 위치에서 물고기를 먹는 최단거리 구하기.
// 물고기를 먹을 수 있는 조건. 이동할 수 있는 조건에 대해서 고려.

var nowSize: Int = 2
var nowX: Int = 0
var nowY: Int = 0

// 상어 위치 찾기 -> 그 위치는 빈칸.
for row in 0..<n {
    for col in 0..<n {
        if graph[row][col] == 9 {
            nowX = row
            nowY = col
            
            graph[row][col] = 0
        }
    }
}

// 상하좌우
let dx: [Int] = [-1, 1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]

// 현재 노드에서 모든 노드로의 최단 거리.
// 현재 상어의 크기보다 물고기의 크기가 같거나 작다면 지나갈 수 있음.
func bfs() -> [[Int]] {
    var distance: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: n)
    var queue: [(x: Int, y: Int)] = []
    
    queue.append((nowX, nowY))
    distance[nowX][nowY] = 0
    
    while !queue.isEmpty {
        let first: (x: Int, y: Int) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx: Int = first.x + dx[i]
            let ny: Int = first.y + dy[i]
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if distance[nx][ny] == -1 && graph[nx][ny] <= nowSize {
                    distance[nx][ny] = distance[first.x][first.y] + 1
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    return distance
}

// 최단 거리 그래프가 주어졌을 때, 먹을 수 있는 물고기 찾기.
// 최단 거리 그래프에서 갈 수 있어야 함. 물고기 그래프에서 상어 사이즈보다 작아야 함. 물고기 그래프에서 1 이상이어야 함.(0은 빈칸)
func find(_ distance: [[Int]]) -> (x: Int, y: Int, minDistance: Int) {
    var x: Int = -1
    var y: Int = -1
    var minDistance: Int = Int.max
    
    for row in 0..<n {
        for col in 0..<n {
            if distance[row][col] != -1 && graph[row][col] < nowSize && graph[row][col] >= 1 {
                if distance[row][col] < minDistance {
                    minDistance = distance[row][col]
                    x = row
                    y = col
                }
            }
        }
    }
    
    return (x, y, minDistance)
}

/// 더이상 먹을 수 있는 물고기가 없을때까지의 걸린 시간.
var answer: Int = 0
/// 물고기를 먹은 수.
var ate: Int = 0

while true {
    // 현재 위치에서 최단 거리 그래프 중 먹을 수 있는 가장 가까운 물고기의 좌표와 거리 반환.
    let result: (x: Int, y: Int, minDistance: Int) = find(bfs())
    
    if result.x != -1 {
        nowX = result.x
        nowY = result.y
        answer += result.minDistance
        ate += 1
        graph[nowX][nowY] = 0
        
        if ate >= nowSize {
            nowSize += 1
            ate = 0
        }
    } else {
        // 더 이상 먹을 수 있는 물고기가 없음.
        break
    }
}

print(answer)

/*
3
0 0 1
0 0 0
0 9 0

결과
3


4
4 3 2 1
0 0 0 0
0 0 9 0
1 2 3 4
 
결과
14
*/
