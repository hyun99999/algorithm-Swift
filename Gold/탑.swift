// 왼쪽부터 오른쪽 방향으로 차례로 탑을 세운다.
// 탑의 꼭대기에서 레이저를 송신하고 지표면과 평행하게 발사된다.
// 레이저 신호는 가장 먼저 만나는 하나의 탑에만 수신이 가능하다.
// 탑들이 주어질 때 레이저 신호가 어느 탑에서 수신하는지 알아내시오.
// 수신하는 탑이 없다면 0

let n: Int = Int(readLine()!) ?? 0
let towers: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// n이 500,000 이하이기 때문에 모든 타워마다 앞선 순서의 타워를 순회하는 것은 시간초과.O(n^2)
// 왼쪽 방향으로 레이저 발사 -> 스택 자료구조

var stack: [Int] = []
var answer: [Int] = Array(repeating: 0, count: n)

// 항상 맨 앞의 탑은 수신할 탑이 존재하지 않음.

for i in 0..<towers.count {
    if stack.isEmpty {
        answer[i] = 0
        stack.append(i)
    } else {
        while !stack.isEmpty {
            let last: Int = stack.removeLast()
            
            if towers[last] >= towers[i] {
                answer[i] = last + 1
                stack.append(last)
                stack.append(i)
                break
            }
            
            if stack.isEmpty {
                stack.append(i)
                answer[i] = 0
                break
            }
        }
    }
}

print(answer.map { String($0) }.joined(separator: " "))

/*
5
6 9 5 7 4
*/

// 답: 0 0 2 2 4
