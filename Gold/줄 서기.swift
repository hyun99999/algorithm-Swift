// n명의 학생들이 키 순서대로 줄을 선다.
// 키를 비교하여 각 학생이 설 수 있는 위치의 범위를 구하시오.

// (자신 앞에 확정된 인원 + 1, n - 뒤에 확정된 인원)

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: nm[0] + 1), count: nm[0] + 1)

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
    
    graph[input[0]][input[1]] = true
}

// i -> j graph[i][j] 가 true
// graph[j][i] 가 false
// 둘 다 true 라면 사이클이 발생. 불가능.

func check() {
    // ✅ 플로이드 워셜.
    // 경유지를 기준으로 앞뒤 확인.
    for i in 1...nm[0] {
        for start in 1...nm[0] {
            for end in 1...nm[0] {
                if graph[start][i] && graph[i][end] {
                    graph[start][end] = true
                }
            }
        }
    }
    
    // 불가능 확인.
    for i in 1...nm[0] {
        for j in 1...nm[0] {
            if graph[i][j] && graph[j][i] {
                print(-1)
                
                return
            }
        }
    }
    
    // 앞 뒤 확인.
    for start in 1...nm[0] {
        var left: Int = 1
        var right: Int = nm[0]
        
        for end in 1...nm[0] {
            if graph[start][end] {
                // 자신 뒤에 확정.
                right -= 1
            }
            
            if graph[end][start] {
                // 자신 앞에 확정.
                left += 1
            }
        }
        
        print(left, right)
    }
}

check()

/*
3 2
1 3
2 3
*/

/*
답:
1 2
1 2
3 3
*/
