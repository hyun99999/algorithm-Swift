import Foundation

// 10진법 -> 3진법 -> 앞뒤 반전 -> 10진법
// String(n, radix:3) 으로 3진법으로 변경해보겠다.
func solution(_ n:Int) -> Int {
    var reversedTernary: String = ""
    
    let ternary = String(n, radix: 3)
    for number in ternary.reversed() {
        reversedTernary += String(number)
    }
    
    return Int(reversedTernary, radix: 3)!
}

let result = solution(45)
// 7
print(result)
