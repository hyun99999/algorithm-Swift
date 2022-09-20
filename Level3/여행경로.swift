/*
import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    // 주어진 항공권을 모두 사용
    
    var ticketInfo: [String : [String]] = [:]
    var answer: [String] = []
    
    for index in 0..<tickets.count {
        let start: String = tickets[index][0]
        let destination: String = tickets[index][1]
        
        if ticketInfo[start] != nil {
            ticketInfo[start]!.append(destination)
            ticketInfo[start]!.sort()
        } else {
            ticketInfo[start] = [destination]
        }
    }
    
    // 항상 ICN 에서 출발.
    var start: String = "ICN"
    var destination: String = ""
    answer.append(start)
    
    for _ in 0..<tickets.count {
        destination = ticketInfo[start]!.removeFirst()
        answer.append(destination)
        start = destination
    }
    
    return answer
}
*/

print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
// ["ICN", "JFK", "HND", "IAD"]

print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
// ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]

// ❗️1,2번 케이스 런타임 에러
// 항공권을 모두 사용할 수 있어야 한다가 조건이다. 또한, 동일한 항공권이 여러 장 주어질 수도 있다.
// 모든 항공권을 사용해야하기 때문에 DFS 사용하여 재귀 호출로 풀어야 한다.
// ✅항공권에 대해서 재귀호출을 이용한 백트래킹 기법으로 해결

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var visited = Array(repeating: false, count: tickets.count)
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var path = [String]()
    
    func dfs(_ airport: String) {
        if path.count == tickets.count {
            path.append(airport)
            return
        }
        
        for i in 0..<tickets.count {
            let start = tickets[i][0]
            let destination = tickets[i][1]
            
            if airport == start && visited[i] == false {
                visited[i] = true
                path.append(start)
                
                dfs(destination)
                
                // 재귀 종료 조건.
                // 모든 도시를 방문했으면 종료.
                if path.count == tickets.count + 1 {
                    return
                }

                // 재귀 호출에 대한 백트래킹
                path.removeLast()
                visited[i] = false
            }
        }
    }
    dfs("ICN")
    
    return path
}

