import Foundation

// 철수와 영희는 절반씩 나눠가진 카드 중에 가장 큰 양의 정수 a 를 구하려 한다.
// 다음의 조건 중 하나만 만족하면 됨.
// 철수가 가진 숫자들을 나눌 수 있고, 영희가 가진 숫자는 나눌 수 없는 양의 정수 a
// 영희가 가진 숫자들을 나눌 수 있고, 철수가 가진 숫자는 나눌 수 없는 양의 정수 a

// arrayA 와 arrayB 가 주어졌을 때 조건을 만족하는 가장 큰 양의 정수 a 반환.
// 없다면 0 반환.
func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var gcdOfB: Int = 0
    var gcdOfA: Int = 0
    
    let divisorA: Int = greatestCommonDivisor(of: arrayA)
    if isDivisible(array: arrayB, with: divisorA) {
        gcdOfA = 0
    } else {
        gcdOfA = divisorA
    }
    
    let divisorB: Int = greatestCommonDivisor(of: arrayB)
    if isDivisible(array: arrayA, with: divisorB) {
        gcdOfB = 0
    } else {
        gcdOfB = divisorB
    }
    print(divisorA, divisorB)
    return max(gcdOfA, gcdOfB)
}

func isDivisible(array: [Int], with divisor: Int) -> Bool {
    for value in array {
        if value % divisor == 0 {
            return true
        }
    }
    return false
}

/// array 의 원소들을 모두 나눌 수 있는 제일 큰 정수를 반환.
func greatestCommonDivisor(of array: [Int]) -> Int {
    var gcd = 0
    let min: Int = array[0]
    
    // min 의 약수를 구하기.
    var divisors: [Int] = []
        let mid: Int = Int(sqrt(Double(min)))
        
        for i in 1...mid {
            if min % i == 0 {
                divisors.append(i)
                if min / i != i {
                    divisors.append(min / i)
                }
            }
        }
    
    divisors.sort(by: >)
    
    // array 원소들의 최대 공약수인가?
    var isGCD: Bool = false
    for divisor in divisors {
        for value in array {
            if value % divisor != 0 {
                isGCD = false
                break
            }
            isGCD = true
            gcd = divisor
        }
        
        if isGCD {
            break
        }
    }
    
    return gcd
}

print(solution([14, 35, 119], [18, 30, 102]))
// 7

print(solution([14, 35], [35]))
// 0
