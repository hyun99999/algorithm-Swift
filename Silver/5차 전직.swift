import Foundation

// 5차 전직을 하려면 아케인스톤이라는 아이템을 받아야 합니다.
// 총 n개의 퀘스트를 진행해서 n개의 아케인스톤을 받아야 함.
// i번째 퀘스트를 진행하면 ai의 경험치과 i번째 아케인스톤이 주어집니다.
// i번째 퀘스트의 보상 경험치를 받을 때 활성화된 아케인스톤에는 동일한 경험치가 추가.
// 최대 k개의 아케인스톤이 동시에 활성화 가능.
// 모인 경험치의 합의 최댓값은?

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let a: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// 아이디어: 경험치를 적게 주는 스톤부터 퀘스트를 해결해서 활성화한다.

let sortedA: [Int] = a.sorted(by: <)

var activeStones: Int = 0
var answer: Int = 0

for index in 0..<sortedA.count {
    answer += sortedA[index] * activeStones
    
    if activeStones + 1 <= nk[1] {
        activeStones += 1
    }
}

print(answer)

/*
3 2
100 300 200

결과
800
*/
