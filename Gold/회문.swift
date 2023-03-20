import Foundation

// 회문, 팰린드롬은 앞 뒤 방향으로 볼 때 같은 순서의 문자로 구성된 문자열을 의미한다.
// 그 자체는 회문이 아니지만 한 문자를 삭제하여 회문을 만들 수 있다면 이것을 유사회문이라고 부른다.
// 회문이면 0 / 유사회문이면 1 / 일반 문자열이면 2를 출력

// 아이디어: 투포인터.

@frozen
enum Palindrome: Int {
    case palindrome = 0
    case pseudoPalindorme = 1
    case normal = 2
}

let t: Int = Int(readLine()!) ?? 0
var answer: [Int] = []

/// str 파라미터가 회문인지, 유사회문인지, 일반 문자열인지 반환.
func isPalindrome(_ str: [String], start: Int, end: Int, count: Int) -> Palindrome {
    var start: Int = start
    var end: Int = end
    let count: Int = count
    
    while start < end {
        if str[start] == str[end] {
            start += 1
            end -= 1
        } else {
            if count <= 1 &&
                isPalindrome(str, start: start + 1, end: end, count: 2) == .palindrome ||
                isPalindrome(str, start: start, end: end - 1, count: 2) == .palindrome {
                return .pseudoPalindorme
            } else {
                return .normal
            }
        }
    }
    
    return .palindrome
}

for _ in 0..<t {
    let input: [String] = readLine()!.map { String($0) }
    
    answer.append(isPalindrome(input, start: 0, end: input.count - 1, count: 0).rawValue)
}

answer.forEach { print($0) }

/*
7
abba
summuus
xabba
xabbay
comcom
comwwmoc
comwwtmoc

결과
0
1
1
2
2
0
1
*/
