import Foundation

// BFS(너비 우선 탐색)
// queue 가 없어질 때까지
func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    // 카드 16장 뒷면 4 * 4.
    // 8가지 캐릭터 2장씩 무작위 배치.(1부터 6까지 자연수 2개씩)
    // 유저가 2장을 선택하여 앞면으로 뒤집어 같은 그림이면 게임에서 사라짐.
    // 같은 그림이 아니라면 뒷면이 보이도록 뒤집음.
    
    // 방향키로 1칸 이동.
    // [Ctrl] + 방향키로 가장 가까운 카드로 이동. if 카드가 없다면 마지막 칸으로 이동.
    // 두 번째 카드를 뒤집을 때까지 첫 번째 카드 앞면유지.
    // 앞면이 되었을 때 같은지 다른지 판단.
    
    // 모든 카드를 제거하는데 필요한 키 조작 횟수 최솟값 구하기
    
    // ✅ 아이디어 : 카드 종류가 최대 6개. 어떤 카드부터 제거할지 경우의 수는 6!(최대 720가지이기 때문에 괜찮다)
    // 현재 커서 위치 -> XA -> XB 혹은 현재 커서 위치 -> XB -> XA 두 가지 고려
    // XB -> YA -> YB 혹은 XB -> YB -> YA 두 가지 고려
    
    // 튜플 2차원 배열.
    var location: [[(Int, Int)]] = Array(repeating: [], count: 6)
    
    // 카드 갯수
    var cardCount: Int = 0
    var answer: Int = Int.max
    
    let initalVisted: [[Bool]] = Array(repeating: Array(repeating: false, count: 4), count: 4)
    
    for row in 0..<board.count {
        for col in 0..<board[0].count {
            if board[row][col] != 0 {
                location[board[row][col] - 1].append((row, col))
                cardCount += 1
            }
        }
    }
    
    // 카드 제거 순서 저장할 배열
    var order: [[(Int, Int)]] = []
    
    func getPath(_ path: [(Int, Int)], _ counting: Int) {
        if counting == 0 {
            order.append(path)
        }
        
        for location in location {
            if !location.isEmpty && !path.contains(where: { $0.0 == location[0].0 && $0.1 == location[0].1 }) {
                getPath(path + location, counting - 2)
                getPath(path + [location[1], location[0]], counting - 2)
            }
        }
    }
    
    func visit(_ now: (Int, Int), _ board: [[Int]], _ order: [(Int, Int)], _ weight: Int, _ visited: [[Bool]]) {
        if order.isEmpty {
            answer = min(answer, weight)
            return
        }
        
        var visited = visited
        
        // BFS
        func bfs() -> Int {
            var queue: [(Int, Int, Int)] = []
            var queueIndex: Int = 0
            var answer = Int.max
            
            func visit(_ now: (Int, Int, Int)) {
                if now.0 == order[0].0 && now.1 == order[0].1 {
                    answer = now.2 + 1
                    return
                }
                
                // 아래로 이동
                if now.0 + 1 < 4 {
                    if !visited[now.0 + 1][now.1] {
                        visited[now.0 + 1][now.1] = true
                        queue.append((now.0 + 1, now.1, now.2 + 1))
                    }
                    
                    // ctrl 이동
                    var next = 3
                    
                    for i in now.0 + 1..<4 {
                        if board[i][now.1] != 0 {
                            next = i
                            break
                        }
                    }
                    
                    if !visited[next][now.1] {
                        visited[next][now.1] = true
                        queue.append((next, now.1, now.2 + 1))
                    }
                }
                
                // 위로 이동
                if now.0 - 1 >= 0 {
                    if !visited[now.0 - 1][now.1] {
                        visited[now.0 - 1][now.1] = true
                        queue.append((now.0 - 1, now.1, now.2 + 1))
                    }
                    
                    // ctrl 이동
                    var next = 0
                    
                    for i in stride(from: now.0 - 1, to: 0, by: -1) {
                        if board[i][now.1] != 0 {
                            next = i
                            break
                        }
                    }
                    
                    if !visited[next][now.1] {
                        visited[next][now.1] = true
                        queue.append((next, now.1, now.2 + 1))
                    }
                }
                
                // 오른쪽 이동
                if now.1 + 1 < 4 {
                    if !visited[now.0][now.1 + 1] {
                        visited[now.0][now.1 + 1] = true
                        queue.append((now.0, now.1 + 1, now.2 + 1))
                    }
                    
                    // ctrl 이동
                    var next = 3
                    
                    for i in now.1 + 1..<4 {
                        if board[now.0][i] != 0 {
                            next = i
                            break
                        }
                    }
                    
                    if !visited[now.0][next] {
                        visited[now.0][next] = true
                        queue.append((now.0, next, now.2 + 1))
                    }
                }
                
                // 왼쪽 이동
                if now.1 - 1 >= 0 {
                    if !visited[now.0][now.1 - 1] {
                        visited[now.0][now.1 - 1] = true
                        queue.append((now.0, now.1 - 1, now.2 + 1))
                    }
                    
                    // ctrl 이동
                    var next = 0
                    
                    for i in stride(from: now.1 - 1, to: 0, by: -1) {
                        if board[now.0][i] != 0 {
                            next = i
                            break
                        }
                    }
                    
                    if !visited[now.0][next] {
                        visited[now.0][next] = true
                        queue.append((now.0, next, now.2 + 1))
                    }
                }
            }
            
            queue.append((now.0, now.1, 0))
            
            while queueIndex < queue.count {
                if answer != Int.max {
                    break
                }
                
                let select = queue[queueIndex]
                queueIndex += 1
                
                visit(select)
            }
            return answer
        }
        
        var board = board
        var order = order
        
        // 다음 위치로의 최단 거리
        let shortPathWeight = bfs()
        
        let next = order.removeFirst()
        board[next.0][next.1] = 0
        
        visit(next, board, order, weight + shortPathWeight, initalVisted)
    }
    
    for location in location {
        if !location.isEmpty {
            getPath(location, cardCount - 2)
            getPath([location[1], location[0]], cardCount - 2)
        }
    }
    
    for order in order {
        visit((r, c), board, order, 0, initalVisted)
    }
    
    return answer
}

print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))
// 14
