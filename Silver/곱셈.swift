import Foundation
// 자연수 A를 B번 곱한 수를 알고싶다.
// c로 나눈 나머지를 구하는 프로그램을 작성하자.

let abc: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let (a, b, c) = (abc[0], abc[1], abc[2])

// 🚨 런타임 에러.
// abc 는 2,147,483,647 이하의 자연수이다.
// print(Int(pow(Double(a), Double(b))) % c)

// 재귀 + 분할정복
// A^B % C == A^*(B/2)%C * A^*(B/2)%C

func divide(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    if n % 2 == 0 {
        let x: Int = divide(n / 2)
        
        return x % c * x % c
    } else {
        let x: Int = divide((n - 1) / 2)
        
        return a % c * x % c * x % c
    }
}

print(divide(b))

// 10 11 12

// 4
