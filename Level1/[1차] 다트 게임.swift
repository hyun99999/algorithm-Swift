import Foundation

func solution(_ dartResult:String) -> Int {
    // split(whereSeparator:) 의 클로저를 통해서 구분해야하는 기능 구현
    let numbers = dartResult.split(whereSeparator: { $0.isLetter || $0 == "*" || $0 == "#" })
    let operators = dartResult.split(whereSeparator: { $0.isNumber })
    
    var result = numbers.map { Int($0)! }
    
    for (index, value) in operators.enumerated() {
        // D
        // D*
        // D#
        // 과 같은 형태로 operators 의 요소들이 존재.
        for c in String(value) {
            switch c {
            case "S":
                break
            case "D":
                result[index] *= result[index]
            case "T":
                result[index] *= result[index] * result[index]
            case "*":
                if index != 0 {
                    result[index - 1] *= 2
                }
                result[index] *= 2
            case "#":
                result[index] *= -1
            default:
                break
            }
        }
    }
    
    return result.reduce(0, +)
}

print(solution("1S*2T*3S"))
// 23
