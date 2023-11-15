// 1부터 N까지 수를 이어서 쓰면 하나의 수를 얻을 수 있다.
// Ex. 1234567891011121314151617181920212223...
// 새로운 수의 앞에서 k번째 자리 숫자가 어떤 숫자인지 구하시오.

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let n: Int = input[0]
var k: Int = input[1]

// n 자리의 숫자는 총 9 * 10^n * n 개가 존재

/// 자리수
var index: Int = 1
/// 자리수마다 숫자 개수
var count: Int = 9
/// 자리수마다 문자의 개수
var minus: Int = index * count
/// 시작점 찾기
var num: Int = 0

while k > minus {
    k -= minus
    
    index += 1
    num += count
    count *= 10
    
    minus = index * count
}

// while 문을 탈출했기 때문에 k - 1을 사용

let increase: Int = (k - 1) / index
let offset: Int = (k - 1) % index

num += increase + 1

if num > n {
    print(-1)
} else {
    let numIndex = String(num).index(String(num).startIndex, offsetBy: offset)
    print(String(num)[numIndex])
}

// 20 23

// 답 6
