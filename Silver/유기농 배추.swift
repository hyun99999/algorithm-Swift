import Foundation

// 지렁이는 배추근처의 해충을 잡아먹어 배추를 보호한다.
// 배추의 상하좌우 인접한 배추로 지렁이는 이동할 수 있기 때문에 보호할 수 있다.
// 총 몇 마리의 지렁이가 필요한가?

// dfs, bfs 모두로 풀 수 있다.

typealias Point = (row: Int, col: Int)

// 상하좌우
let drow: [Int] = [-1, 1, 0, 0]
let dcol: [Int] = [0, 0, -1, 1]
let t: Int = Int(readLine()!) ?? 0

var answer: [Int] = []

// MARK: - 테스트 케이스

for _ in 0..<t {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    /// 가로 길이.
    let m: Int = input[0]
    /// 세로 길이.
    let n: Int = input[1]
    /// 배추 수.
    let k: Int = input[2]
    
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    /// 지렁이의 수.
    var count: Int = 0
    
    // MARK: - 배추밭 초기화.
    
    for _ in 0..<k {
        let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
        let col: Int = input[0]
        let row: Int = input[1]
        
        graph[row][col] = 1
    }
    
    // MARK: - DFS

    func dfs(_ start: Point) {
        visited[start.row][start.col] = true
        
        // 이동.
        for i in 0..<4 {
            let next: Point = (start.row + drow[i], start.col + dcol[i])
            if n > next.row && next.row >= 0 &&
                m > next.col && next.col >= 0 &&
                graph[next.row][next.col] == 1 &&
                !visited[next.row][next.col] {
                dfs(next)
            }
        }
    }
    
    // MARK: - 배추밭 확인.
    
    for row in 0..<n {
        for col in 0..<m {
            if graph[row][col] == 1 && !visited[row][col] {
                dfs((row, col))
                count += 1
            }
        }
    }
    answer.append(count)
}

answer.forEach { print($0) }
