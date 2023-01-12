import Foundation

// d 를 넘는 위치의 점은 찍지 않는다. -> 거리를 구하는 함수 필요.
// x와 y축에 대해서 k만큼씩 떨어지는 점을 찍는다.
// 총 몇개의 점이 찍히나요?
/*
func solution(_ k:Int, _ d:Int) -> Int64 {
    var answer: Int64 = 0
    
    for x in stride(from: 0, through: d, by: k) {
        for y in stride(from: 0, through: d, by: k) {
            if distanceZero(to: x, y) <= Double(d) {
                answer += 1
            }
        }
    }
    
    return answer
}

func distanceZero(to x: Int, _ y: Int) -> Double {
    return sqrt(Double(x * x) + Double(y * y))
}
 */
// (d,d) 까지 모든 점들의 거리를 판단했더니 시간초과가 나왔다.(이중 for문)
// 시간초과(테스트 8,11,13,14)
// -> x좌표로 y좌표가 결정되기 때문에 y좌표만큼 answer 에 더하기.
func solution(_ k:Int, _ d:Int) -> Int64 {
    var answer: Int64 = 0
    
    for x in stride(from: 0, through: d, by: k) {
        let maxY = Int64(sqrt(Double(d * d - x * x)))
        
        let k: Int64 = Int64(k)
        answer += maxY / k + 1
    }
    
    return answer
}

print(solution(2, 4))
// 6
