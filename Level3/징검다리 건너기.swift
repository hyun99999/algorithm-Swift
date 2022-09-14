import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    // 숫자가 적힌 디딤돌은 밟으면 1씩 줄어든다.
    // 디딤돌의 숫자가 0이 되면 더 이상 밟을 수 없음.
    // 그 다음 디딤돌로 여러칸 이동 가능.
    // 대신 k 만큼 최대로 여러칸 이동 가능.
    // 최대 몇 명까지 건널 수 있는가?
    
    var stones = stones
    
    // ✅ 아이디어 : 배열의 크기는 200,000 이지만, 원소의 값이 200,000,000 이기 때문에 이를 고려해야 효율성 통과 가능.
    // 200,000,000 값을 이진탐색을 통해 통과 가능한 값을 구하기.
    
    // 이진탐색
    
    var low: Int = 1
    var high: Int = 200000000
    
    while low <= high {
        let mid: Int = (low + high) / 2
            
        var count: Int = 0
        var maxCount: Int = 0
        for stone in stones {
            if stone - mid <= 0 {
                count += 1
            } else {
                count = 0
            }
            maxCount = max(count, maxCount)
        }
        
        if maxCount >= k {
            // 좌측
            high = mid - 1
        } else {
            // 우측
            low = mid + 1
        }
    }
    
    return low
}

print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
// 3
