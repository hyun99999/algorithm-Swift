import Foundation

func solution(_ x:Int) -> Bool {
    // 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다.
    
    let array: [String] = String(x).map { String($0) }
    let sum: Int = array.reduce(0) { $0 + Int($1)! }
    
    return x % sum == 0 ? true : false
}

print(solution(100))
// true
