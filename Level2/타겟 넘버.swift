import Foundation

// dfs 깊이 우선 탐색
// stack 구현, 재귀
func solution(_ numbers:[Int], _ target:Int) -> Int {
    let numbers = numbers
    let target = target
    var count = 0
    
    func dfs(index: Int, sum: Int) {
        // 깊이 끝에 다다름
        if index == numbers.count {
            if target == sum {
                count += 1
            }
            return
        }
        
        // 재귀 호출
        dfs(index: index + 1, sum: sum + numbers[index])
        dfs(index: index + 1, sum: sum - numbers[index])
    }
    
    dfs(index: 0, sum: 0)
    
    return count
}



print(solution([1,1,1,1,1], 3))
// 5
