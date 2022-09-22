import Foundation

// 이분탐색
func solution(_ n:Int, _ times:[Int]) -> Int64 {
    // 가장 앞에 있는 사람은 비어있는 심사대로 가서 심사 가능.
    // 심사를 받는 시간 최소
    // times 는 각 심사관이 한 명을 심사하는데 걸리는 시간.
    
    var answer: Int = 0
    
    var low: Int = 1
    // 최대는 가장 오래걸리는 심사관이 오롯이 진행하는 것.
    var high: Int = times.max()! * n
    
    // 이분탐색을 사용하기 위한 정렬
    var times: [Int] = times.sorted(by: <)
    
    
    while low <= high {
        let mid: Int = (low + high) / 2
        var sum: Int = 0
        
        for index in 0..<times.count {
            sum += mid / times[index]
        }
        
        if sum < n {
            // 우측
            low = mid + 1
        } else {
            high = mid - 1
            answer = mid
        }
    }
    
    
    // 모든 사람이 심사를 받는데 걸리는 시간 반환.
    return Int64(answer)
}
