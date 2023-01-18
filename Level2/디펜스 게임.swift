import Foundation

// n명으로 적의 공격을 순서대로 막는 게임
// 매 라운드마다 enemy[i] 만큼 적이 등장하고 병사에서 제외한다.
// 남은 병사보다 enemy[i] 가 더 많으면 게임이 종료
// 무적권을 사용하여 병사 소모 없이 라운드 공격을 막을 수 있다.
// 최대 k 번 무적권을 사용할 수 있다.
// 적절하게 무적권을 사용해서 최대한 많은 라운드를 진행하면 몇라운드인가?
func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    // ✅ 아이디어: 모든 상황을 판단할 수 없으니 이진 탐색으로 판단.
    // 파라메트릭 서치 - 이진 탐색을 통해 주어진 범위의 해답을 결정하는 문제.
    
    var low: Int = 0
    /// 최대는 모든 라운드를 막을 수 있는 경우.
    var high: Int = enemy.count - 1
    
    // n명의 병사, k개의 무적권을 사용하여 막을 수 있다면 low 이동.
    // 막을 수 없다면 high 이동.
    while low <= high {
        let mid: Int = (low + high) / 2
        let stortedEnemy: [Int] = Array(enemy[0...mid]).sorted(by: <)
        
        if isDefencible(mid, n, k, stortedEnemy) {
            low = mid + 1
        } else {
            high = mid - 1
        }
     }
    
    return low
}

/// n명의 병사와 k개의 무적권으로 enemy[mid]까지 막을 수 있는 여부를 반환.
func isDefencible(_ mid: Int, _ n: Int, _ k: Int, _ sortedEnemy: [Int]) -> Bool {
    var k: Int = k
    var n: Int = n
    // 적은 수의 적부터 제거하기 위해서. -> 효율적인 무적권 사용.
    //
//    let sortedEnemy: [Int] = Array(enemy[0...mid])
    
    for index in 0..<sortedEnemy.count {
        if n < sortedEnemy[index] && k != 0 {
            k -= 1
            n -= sortedEnemy[index]
        } else if n >= sortedEnemy[index] {
            n -= sortedEnemy[index]
        } else {
            return false
        }
    }
    
    return true
}
// 시간초과(테스트 3,6,7,8,9,10)
// ✅ -> isDefencible() 에서 enemy 배열을 매번 정렬하니 시간초과라고 판단.
// 다른 풀이에서는 우선순위 큐 자료구조가 있어서 시간초과가 아니지만, swift 는 없어서 시간초과가 되었다.

print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
// 5
print(solution(2, 4, [3,3,3,3]))
// 4
