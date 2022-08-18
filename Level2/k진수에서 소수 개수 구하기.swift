import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    // k 진수로 n 을 변환.
    // 아래의 조건에 맞는 소수가 몇개인지 반환.
    
    // 0P0처럼 소수 양쪽에 0이 있는 경우
    // P0처럼 소수 오른쪽에만 0이 있고 왼쪽에는 아무것도 없는 경우
    // 0P처럼 소수 왼쪽에만 0이 있고 오른쪽에는 아무것도 없는 경우
    // P처럼 소수 양쪽에 아무것도 없는 경우
    // 단, P는 각 자릿수에 0을 포함하지 않는 소수입니다. 예를 들어, 101은 P가 될 수 없습니다.
    let decimal: String = String(n, radix: k)
    
    // 아이디어 : 조건을 충족하기 위해서 0 을 기준으로 문자열을 나누고, 소수 판별을 진행한다.
    
//    let decimals: [String.SubSequence] = decimal.split(separator: "0")
    // components 를 사용하게 되면 00 과 같은 연속적인 경우 "" 가 들어감.
    let decimals: [String] = decimal.components(separatedBy: "0").filter { $0 != "" }

    print(decimals)
    func isPrime(_ number: Int) -> Bool {
        if number <= 3 {
            return number == 1 ? false : true
        } else {
            for i in 2...Int(sqrt(Double(number))) {
                if number % i == 0 {
                    return false
                }
            }
        }
        
        return true
    }
    
    return decimals.filter { isPrime(Int($0)!) }.count
}

print(solution(437674, 3))
// 3

print(solution(43007674, 10))
// 1

print(solution(43001, 10))
