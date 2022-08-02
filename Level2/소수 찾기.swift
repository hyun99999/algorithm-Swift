
import Foundation

func solution(_ numbers:String) -> Int {
    let numbersArray: [String] = numbers.map { String($0) }
    var visited: [Bool] = []
    // 중복을 효율적으로 지우기 위해서 Int 로 변환하여 Set 에 담는다.
    var numberSet: Set<Int> = []
    
    // 재귀를 통해 순열 구현.
    // rCount: 만들고 싶은 숫자의 길이.
    func permutation(_ numArr: [String], count: Int, rCount: Int) {
        if count == rCount {
            numberSet.insert(Int(numArr.joined())!)
            return
        }
        
        for (index, value) in numbersArray.enumerated() {
            if visited[index] {
                continue
            }
            
            var newNumArr = numArr
            newNumArr.append(value)
            
            visited[index] = true
            permutation(newNumArr, count: count+1, rCount: rCount)
            visited[index] = false
        }
    }
    
    for i in 1...numbersArray.count {
        visited = Array(repeating: false, count: numbersArray.count)
        
        permutation([], count: 0, rCount: i)
    }
        
    return numberSet.filter { isPrime($0) }.count
}

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num <= 1 ? false : true
    } else {
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}

print(solution("011"))
// 2
