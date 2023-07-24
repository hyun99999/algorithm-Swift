// 주사위에는 1-6 적혀있고 10*10 보드판에서 진행된다.
// 플레이어는 주사위를 굴려 나온 수만큼 이동하고, 100번 칸을 넘어갈 수 없다.

// 도착한 칸이 사다리다면 -> 위로 올라감
// 뱀이 있다면 -> 내려감
// 1번에서 시작하여 100번 칸에 도착하고자 한다.
// 이때 주사위를 굴려야 하는 횟수의 최솟값으 구하시오.

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var board: [Int] = Array(repeating: 0, count: 100)

for number in 1...100 {
    board[number - 1] = number
}

var ladders: [Int : Int] = [:]
var snakes: [Int : Int] = [:]

for _ in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    ladders[input[0], default: 0] = input[1]
}

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    snakes[input[0], default: 0] = input[1]
}


// 아이디어: 1부터 100까지 최단거리 구하기
// bfs
// 주사위는 1-6.

var visited: [Bool] = Array(repeating: false, count: 101)
var queue: [Int] = []
var newBoard: [Int] = Array(repeating: 0, count: 101)

func bfs(_ start: Int) {
    visited[start] = true
    queue.append(start)
    
    while !queue.isEmpty {
        let first: Int = queue.removeFirst()
        
        if first == 100 {
            break
        }
        
        for i in 1..<7 {
            // 🚨 사다리와 뱀을 만나게되면 바로 이동.
            var next: Int = first + i
            
            if next <= 100 && !visited[next] {
                if ladders[next] != nil {
                    next = ladders[next, default: 0]
                }
                
                if snakes[next] != nil {
                    next = snakes[next, default: 0]
                }
                
                if !visited[next] {
                    newBoard[next] = newBoard[first] + 1
                    queue.append(next)
                    visited[next] = true
                }
            }
        }
    }
}

bfs(1)
print(newBoard[100])

/*
3 7
32 62
42 68
12 98
95 13
97 25
93 37
79 27
75 19
49 47
67 17
*/

// 3
