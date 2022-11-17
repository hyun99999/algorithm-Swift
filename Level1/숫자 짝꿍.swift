/*
import Foundation

func solution(_ X:String, _ Y:String) -> String {
    // x 와 y 의 임의의 자리에서 공통으로 나타나는 정수 k
    // k 를 이용하여 만들 수 있는 가장 큰 정수를 두 수의 짝꿍이라고 한다.
    var x: [String] = X.sorted(by: >).map { String($0) }
    var y: [String] = Y.sorted(by: >).map { String($0) }
    var array: [String] = []
    
    while !(x.isEmpty || y.isEmpty) {
        let firstX: String = x.removeFirst()
        
        for n in 0..<y.count {
            if firstX == y[n] {
                array.append(firstX)
                y.remove(at: n)
                
                break
            } else if firstX > y[n] {
                break
            } else {
                // firstX < y[n]
                continue
            }
        }
    }
    
    if array.count == 0 {
        return "-1"
    } else {
        array.sort(by: >)
        
        return String(Int(array.joined())!)
    }
}
*/

// 테스트 케이스 6-10번 실패.
// 테스트 케이스 11-15 시간 초과.
// 47.4/100

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    // x 와 y 의 임의의 자리에서 공통으로 나타나는 정수 k
    // k 를 이용하여 만들 수 있는 가장 큰 정수를 두 수의 짝꿍이라고 한다.
    var x: [String] = X.map { String($0) }
    var y: [String] = Y.map { String($0) }
    var xArray: [Int] = Array(repeating: 0, count: 10)
    var yArray: [Int] = Array(repeating: 0, count: 10)
    var answers: [String] = []
    
    // array 에 0-9 까지의 숫자 갯수 설정.
    
    for index in 0..<x.count {
        xArray[Int(x[index])!] += 1
    }
    
    for index in 0..<y.count {
        yArray[Int(y[index])!] += 1
    }
    
    // array 를 비교하여 answer 작성.(9->0 순서로 탐색하면 sort 하는 시간복잡도 제거 가능.)
    
    for key in (0..<10).reversed() {
        if xArray[key] != 0 && xArray[key] != 0 {
            for _ in 0..<min(xArray[key], yArray[key]) {
                answers.append(String(key))
            }
        }
    }
    
    if answers.count == 0 {
        return "-1"
    } else if answers[0] == "0" {
        return "0"
    } else {
        return answers.joined()
    }
}

print(solution("5525", "1255"))
// 552

print(solution("000", "00"))
