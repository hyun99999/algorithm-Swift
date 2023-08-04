// 문자열 s 를 뒤집기.
// s는 다음의 규칙을 가진다.
// 알파벳 소문자, 숫자, 공백, 특수문자(<, >)
// 문자열의 시작과 끝은 공백이 아니다.

let input: [String] = readLine()!.map { String($0) }

var answer: [String] = []
var open: Bool = false
var stack: [String] = []

for i in 0..<input.count {
    if input[i] == "<" {
        if !stack.isEmpty {
            answer += stack.reversed()
            stack = []
        }
        open = true
        answer.append("<")
    } else if input[i] == ">" {
        open = false
        answer += stack
        answer.append(">")
        stack = []
    } else if input[i] == " " {
        if open {
            answer += stack + [" "]
        } else {
            answer += stack.reversed() + [" "]
        }
        stack = []
    } else {
        stack.append(input[i])
    }
}
answer += stack.reversed()

print(answer.joined())

// baekjoon online judge
// noojkeab enilno egduj

// <open>tag<close>
// <open>gat<close>

// <ab cd>ef gh<ij kl>
// <ab cd>fe hg<ij kl>
