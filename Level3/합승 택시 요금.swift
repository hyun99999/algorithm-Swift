import Foundation

// 아이디어: 플로이드-워셜(Floyd-Warshal) 알고리즘
func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var answer = 0
    // 플로이드-워셜 알고리즘을 사용하기 위해서 2차원 배열 필요.
    // 모든 노드에서 다른 모든 노드의 최단 거리를 담음.
    var node: [[Int]] = []

    // 요금 1이상 100,000이하.
    // n 은 최대 200개.
    node = Array(repeating: Array(repeating: 200 * 100000, count: n + 1), count: n + 1)
    
    for i in 0...n {
        node[i][i] = 0
    }
    
    // 거리 초기화.
    for fare in fares {
        node[fare[0]][fare[1]] = fare[2]
        node[fare[1]][fare[0]] = fare[2]
    }

    // 내려주는 개념을 가지나 다음과 동등하다. 경유지를 하나 거치고 각각 A와 B로 향하는 요금을 정산하는 것.
    // 1...n 의 지점에 대해서 경유지(i)로 지정하여 min(s->i + i->A + i->B) 를 구하는 것.
    
    // Floyd-Warshal 알고리즘
    for i in 1...n { // 거쳐가는 합승내리는 지점.
        for j in 1...n {
            for k in 1...n {
                if node[j][k] > node[j][i] + node[i][k] {
                    node[j][k] = node[j][i] + node[i][k]
                }
            }
        }
    }
    
    // 시작점에서 AB 각각으로 이동하는 경우.
    answer = node[s][a] + node[s][b]
    
    for i in 1...n {
        answer = min(answer, node[s][i] + node[i][a] + node[i][b])
    }
    
    return answer
}

print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))
// 82

// 참고
// https://velog.io/@sainkr/프로그래머스-합승-택시-요금-Swift
