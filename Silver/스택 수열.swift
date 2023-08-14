// 스택 수열
// 스택에 넣는 순서는 오름차순. 스택에 넣고 빼면서 하나의 수열을 만들 수 있다.
// 수열을 만들 수 있는지? 있다면 어떤 순서로 push, pop 해야하는지 알아내시오.

let n: Int = Int(readLine()!) ?? 0

var sequence: [Int] = []

// 1부터 n까지 정수
for _ in 0..<n {
    let input: Int = Int(readLine()!) ?? 0
    
    sequence.append(input)
}

var index: Int = 0
/// push 해야하는 숫자.
var number: Int = 1
var stack: [Int] = []
var answer: [String] = []

stack.append(1)
answer.append("+")

while index < n {
    if stack.isEmpty {
        // push
        number += 1
        stack.append(number)
        answer.append("+")
    } else {
        if stack.last! < sequence[index] {
            // push
            number += 1
            stack.append(number)
            answer.append("+")
        } else if stack.last! == sequence[index] {
            // pop
            stack.removeLast()
            answer.append("-")
            index += 1
        } else if stack.last! > sequence[index] {
            answer = []
            break
        }
    }
}

if answer.isEmpty {
    print("NO")
} else {
    answer.forEach { print($0) }
}


/*
8
4
3
6
8
7
5
2
1
*/

/*
 답
 +
 +
 +
 +
 -
 -
 +
 +
 -
 +
 +
 -
 -
 -
 -
 -
 */
