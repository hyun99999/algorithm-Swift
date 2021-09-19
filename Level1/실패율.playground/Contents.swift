
import Foundation

//func solution(_ N:Int, _ stages:[Int]) -> [Int] {
//    var failPercent = [Int : Float]()
//    for i in 1...N {
//
//        let userCount = stages.filter { $0 >= i }.count
//        let failCount = stages.filter { $0 == i }.count
//
//        if userCount == 0 {
//            failPercent[i] = 0.0
//        } else {
//            failPercent[i] = Float(failCount) / Float(userCount)
//        }
//    }
//    return failPercent.sorted(by: <).sorted(by: {$0.value > $1.value}).map {$0.key}
//}
 

// 이번 문제는 난이도는 낮았지만 시간 제한에 많이 걸렸다.
// filter 함수를 사용하면 시간복잡도가 커진다고 한다. 그래서 이중포문으로 변경해보았다.

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failPercent = [Int : Float]()
    var user = stages.count
    
    for i in 1...N {
        var failCount = 0
        for j in 0..<stages.count {
            if stages[j] == i {
                failCount += 1
            }
        }
        failPercent[i] = Float(failCount) / Float(user)
        user -= failCount
    }
    return failPercent.sorted(by: <).sorted(by: {$0.value > $1.value}).map {$0.key}
}

solution(5, [2, 1, 2, 6, 2, 4, 3, 3])

