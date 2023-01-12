import Foundation

// 2 이상 100 이하의 자연수를 정해 그 수 이하의 카드들을 준비. 그 수 만큼 상자도 준비.
// 무작위로 카드를 상자에 넣고 1번부터 숫자를 붙임.
// 임의의 상자를 하나 선택해서 담긴 카드의 숫자의 상자를 열어가며
// 열어야 하는 상자가 이미 열려있을 때까지 반복.(반복문의 탈출 조건)
// 이렇게 연 상자들은 1번 상자 그룹.
// 남는 상자가 없으면 게임종료. 획득 점수 0점
// 남은 상자가 있으면 다시 임의의 상자를 골라 같은 방식으로 진행(반복)

// 1번, 2번 그룹에 속한 상자의 수를 곱한 값이 게임의 점수.
// cards 에 담긴 순서대로 상자안에 들어있다고 한다. 구할 수 있는 최고 점수는?

// -> 1번, 2번 그룹을 생성.
func solution(_ cards:[Int]) -> Int {
    var restedCards: [Int] = cards
    var vistied: [Bool] = Array(repeating: false, count: cards.count)
    /// 그룹의 갯수를 담은 배열.
    var groups: [Int] = Array(repeating: 0, count: cards.count)
    
    func union(_ first: Int, _ array: [Int]) {
        if vistied[first - 1] {
            return
        }

        vistied[first - 1] = true
        
        if vistied[cards[first - 1] - 1] {
            groups.append(array.count + 1)
            return
        } else {
            union(cards[first - 1], array + [cards[first - 1]])
        }
    }

    while !restedCards.isEmpty {
        
        let first: Int = restedCards.removeFirst()
        
        union(first, [])
    }
    
    groups.sort(by: >)
    
    
    return groups[0] * groups[1]
}

print(solution([8,6,3,7,2,5,1,4]))
// 12

print(solution([2, 1]))
// 0
// 테스트 2번이 위와 같이 1그룹만 나올 경우.
