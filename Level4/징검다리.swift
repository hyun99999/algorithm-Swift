// 출발 지점부터 distance 만큼 떨어진 곳에 도착지점
// 사이의 바위 중 몇 개를 제거하려 한다
// 바위를 n개 제거한 후에 바위 사이의 최솟값 중 가장 큰 값을 반환.

import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    // 마지막 지점까지 추가
    let sortedRocks: [Int] = rocks.sorted() + [distance]
    
    var left: Int = 1
    var right: Int = distance
    var answer: Int = 0
    
    // 바위 50,000 중에 최대 50,000 개 선택 가능
    // 50,000!
    // 모든 조합을 확인하기 어려움.
    // 완전 탐색 중 그리디하게 찾기 -> ✅ 이진탐색
    
    while left <= right {
        /// 거리의 최솟값
        let mid: Int = (left + right) / 2
        // 💪 (거리의 최솟값)이 유효하도록 count 변수 사용.
        // (거리의 최솟값)에 유효해서 바위를 지운 카운트
        var count: Int = 0
        /// 출발하는 바위의 위치
        var start: Int = 0
        
        for i in 0..<sortedRocks.count {
            if sortedRocks[i] - start < mid {
                // (거리의 최솟값)이 유효하다
                // -> 바위를 지움
                // 💪 같은 경우에는 바위를 지우면 안됨.
                count += 1
            } else {
                // (거리의 최솟값)이 유효하지 않음
                // -> 바위를 남김
                start = sortedRocks[i]
            }
        }
        
        if count > n {
            // count개의 바위를 제외하고도 지점들간의 거리가 (거리의 최솟값)에 대해서 유효하다
            // -> 더 작아질 수 있다.
            right = mid - 1
        } else {
            left = mid + 1
            // (거리의 최솟값) 중 최대값 구하기.
            answer = mid
        }
    }
    return answer
}

print(solution(25, [2, 14, 11, 21, 17], 2))
// 4
