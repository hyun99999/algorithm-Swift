import Foundation

// BFS
// queue, while
// 1에서 2와 4로, 2에서 3과 5로, 4에서 5로
func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    // 나중에 k 이하의 갯수만 리턴하면 된다.
    var towns: [Int] = Array(repeating: Int.max, count: N)
    
    // 0 - 경로 없음.
    // 0 이외 - 시간. 경로 있음.
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
    var queue: [Int] = []
    
    //MARK: - road 매개변수를 가지고 graph 초기화.
    
    for road in road {
        let from: Int = road[0] - 1
        let to: Int = road[1] - 1
        let time: Int = road[2]
        
        if graph[from][to] == 0 {
            graph[from][to] = time
            graph[to][from] = time
        } else {
            let minTime = graph[from][to] > time ? time : graph[from][to]
            // 마을의 도로는 양방향 통행이 가능.
            graph[from][to] = minTime
            graph[to][from] = minTime
        }
    }
    
    func bfs() {
        // 1에서 시작.
        queue.append(0)
        towns[0] = 0
        // while 문 사용.
        while !queue.isEmpty {
            let first = queue.removeFirst()
            for n in 1..<N {
                if graph[first][n] != 0 && graph[first][n] + towns[first] < towns[n]{
                    towns[n] = graph[first][n] + towns[first]
                    queue.append(n)
                }
            }
        }
    }
    bfs()

    // 1번 마을도 포함.
    return towns.filter { $0 <= k }.count
}

print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))
// 4

print(solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4))
// 4

// Floyd-Warshal 알고리즘 활용.
import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0

    var coastArr: [[Int]] = []
    var arr: [Int] = []

    // 초기화
    for _ in 0...N{
        arr.append(999999999)
    }

    for i in 0...N{
        coastArr.append(arr)
        coastArr[i][i] = 0 // 자기 자신은 0으로 초기화
    }

    // coastArr 정의
    for i in 0..<road.count{
        if coastArr[road[i][0]][road[i][1]] > road[i][2]{
            coastArr[road[i][0]][road[i][1]] = road[i][2]
            coastArr[road[i][1]][road[i][0]] = road[i][2]
        }
    }
    for k in 1...N{
        for i in 1...N{
            for j in 1...N{
                // k라는 경유지를 거치는 것이 빠르다면 갱신.
                if coastArr[i][k] + coastArr[k][j] < coastArr[i][j]{
                    coastArr[i][j] = coastArr[i][k] + coastArr[k][j]
                }
            }
        }
    }

    for i in 1...N{
        if coastArr[1][i] <= k{
            answer += 1
        }
    }

    return answer
}
