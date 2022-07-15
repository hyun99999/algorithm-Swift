import Foundation

func solution(_ expression:String) -> Int64 {
    let numbers: [Int] = expression.split(whereSeparator: { $0 == "+" || $0 == "*" || $0 == "-" }).map { Int($0)! }
    let operators: [String] = expression.split(whereSeparator: { $0.isNumber }).map { String($0) }
    var result: Int = 0
    
    
    let operatorArray: [String] = ["+", "-", "*"]
    // 우선 순위 조합 만들기
    var indexCombination: [[Int]] = []
    func combination(_ array: [Int]) {
        if array.count == operatorArray.count {
            indexCombination.append(array)
            return
        } else {
            for i in 0..<operatorArray.count {
                if !array.contains(i) {
                    combination(array + [i])
                }
            }
        }
    }
    combination([])
    
    for i in 0..<indexCombination.count {
        var numbers = numbers
        var operators = operators
        // 연산자 목록이 빌 때까지 반복.
        while !operators.isEmpty {
            // 인덱스 조합을 가진 배열을 순회.
            for j in 0..<indexCombination[i].count {
                let element = operatorArray[indexCombination[i][j]]
                // 같은 연산자가 없을 때까지 반복.
                while operators.contains(element) {
                    if let index = operators.firstIndex(of: element) {
                        switch element {
                        case "+":
                            numbers[index] += numbers [index + 1]
                        case "-":
                            numbers[index] -= numbers [index + 1]
                        case "*":
                            numbers[index] *= numbers[index + 1]
                        default:
                            break
                        }
                        numbers.remove(at: index + 1)
                        operators.remove(at: index)
                    } else {
                        break
                    }
                }
            }
            result = result > abs(numbers[0]) ? result : abs(numbers[0])
        }
    }
    
    return Int64(result)
}

//print(solution("50*6-3*2"))
// 300
print(solution("100-200*300-500+20"))
// 60420
