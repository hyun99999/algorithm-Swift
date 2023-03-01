import Foundation

// 화물을 배에 실어야 한다.
// 항구에는 크레인이 N대가 있다.
// 1분에 박스를 하나씩 배에 실을 수 있고, 모든 크레인은 동시에 움직인다.
// 각 크레인은 무게 제한이 있다. 이때 모든 박스를 배로 옮기는 시간의 최솟값을 구하시오.

/// 크레인의 개수. 50이하.
let n: Int = Int(readLine()!) ?? -1
///  각 크레인의 무게 제한.
var weights: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }
/// 박스의 수.
let m: Int = Int(readLine()!) ?? -1
/// 각 박스의 무게.
var boxWeights: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? -1 }

// 모든 박스를 배로 옮길 수 없다면 -1 출력.

weights.sort(by: >)
boxWeights.sort(by: >)

// 아이디어: 남아있는 박스 중 가장 무거운 것부터 옮기면 됨.
// 각 크레인이 사용된 시간 중 가장 큰 시간이 모든 박스를 배로 옮기는 최소 시간이 된다.

var time: Int = 0

if weights.first ?? -1 >= boxWeights.first ?? -1 {
    while !boxWeights.isEmpty {
        for i in 0..<weights.count {
            for (index, value) in boxWeights.enumerated() {
                if value <= weights[i] {
                    boxWeights.remove(at: index)
                    
                    break
                }
            }
        }
        time += 1
    }
    
    print(time)
} else {
    print(-1)
}
