import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0

    // 뜯어낸 스티커의 숫자의 합이 최대
    // 뜨어낸 스티커의 양쪽은 사용 못함.
    // dp 문제
    
    // 첫 번째 스티커를 뜯으면 마지막은 사용할 수 없음.
    // 두 번째 스티커를 뜯으면 마지막을 고려할 수 있음.
    var dp1: [Int] = Array(repeating: 0, count: sticker.count)
    var dp2: [Int] = Array(repeating: 0, count: sticker.count)
    
    if sticker.count <= 2 {
        return sticker.max()!
    }
    
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    
    for i in 2..<sticker.count - 1 {
        dp1[i] = max(dp1[i - 2] + sticker[i], dp1[i - 1])
    }
    
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in 2..<sticker.count {
        dp2[i] = max(dp2[i - 2] + sticker[i], dp2[i - 1])
    }


    return max(dp1.max()!, dp2.max()!)
}

print(solution([14, 6, 5, 11, 3, 9, 2, 10]))
// 36
