import Foundation

func solution(_ number:[Int]) -> Int {
    // 3명의 정수 번호를 더했을 때 0이 되면 삼총사
    var array: [[Int]] = []
    
    // -1000 부터 1000까지의 원소가 들어가기 때문에 for 문 사용.
    for x in 0..<number.count - 2 {
        for y in (x + 1)..<number.count - 1 {
            for z in (y + 1)..<number.count {
                array.append([x, y, z])
            }
        }
    }
    
    return array.map { $0.reduce(0) { $0 + number[$1] } }.filter { $0 == 0 }.count
}

print(solution([-2, 3, 0, 2, -5]))
// 2
