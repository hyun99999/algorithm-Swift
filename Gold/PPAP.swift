// PPAP 문자열
// P 에서 시작하여 문자열 내의 P를 PPAP 로 바꾸는 과정을 반복하여 만들 수 있는 문자열이다.
// P 는 PPAP 문자열.
// PPAP 문자열에서 P하나를 PPAP 로 바꾼 문자열은 PPAP 문자열이다.

// PPAP 문자열이면 PPAP, 아니라면 NP 를 출력.

// O(n).
let input: [String] = readLine()!.map { String($0) }
var stack: [String] = []
// 스택

// count. O(1).
for index in 0..<input.count {
    // append. O(1).
    stack.append(input[index])
    // O(1). RandomAccessCollection 을 채택하는 Array 이기 때문.
    if ["P", "P", "A", "P"] == Array(stack.suffix(4)) {
        // 시간초과
//   if ["P", "P", "A", "P"] == stack.suffix(4) {
        // O(1).
        stack.removeLast()
        stack.removeLast()
        stack.removeLast()
    }
}

if stack == ["P", "P", "A", "P"] || stack == ["P"] {
    print("PPAP")
} else {
    print("NP")
}
