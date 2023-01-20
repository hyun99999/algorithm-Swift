import Foundation

// n개의 집에 택배를 배달하려 한다. 집간의 거리는 1.
// 트럭에는 최대 cap 만큼의 택배를 실을 수 있습니다.
// 배달과 수거를 마치고 물류창고까지 돌아올 수 있는 최소 이동 거리를 구하려 한다.
func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer: Int = 0
    
    // 아이디어: 배달과 픽업이 모두 진행될 동안 계속 해당 집을 와야함.
    // 매번 최대개수만큼 박스를 실고, 초과하면 다음 집에서 사용하면 됨.
    
    var delivery: Int = 0
    var pickUp: Int = 0
    
    for index in (0..<n).reversed() {
        
        // 배달, 픽업 둘다 없음.
        if deliveries[index] == 0 && pickups[index] == 0 {
            continue
        }
        
        /// 해당 집을 들르는 횟수.
        var count: Int = 0
        
        while deliveries[index] > delivery || pickups[index] > pickUp {
            // 올때마다 최대 개수인 cap 만큼 실는다고 가정.
            delivery += cap
            pickUp += cap
            count += 1
        }
        // 실질적으로 해당 집의 방문이 끝날 때 박스의 개수.
        delivery -= deliveries[index]
        pickUp -= pickups[index]
        
        // (총 거리) += (거리) + (들른 횟수) * 2
        answer += (index + 1) * count * 2
    }
    
    return Int64(answer)
}

print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))
// 16

print(solution(2, 2, [0, 6], [0,0]))
// 12
