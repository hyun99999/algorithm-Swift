// ( ) [ ]
// 기호를 이용해서 만들어지는 올바른 괄호열이란 다음과 같다.

// 한 쌍의 괄호로만 이루어진 () []
// x가 올바른 괄호열이면 (x) 나 [x] 도 올바르다.
// x 와 y 모두 올바르다면 이를 결합한 xy 도 올바르다.

// () 2
// [] 3
// (x) 2 * x
// [x] 3 * x
// xy x+y

let input: [String] = readLine()!.map { String($0) }

var answer: Int = 0
var stack: [String] = []
var temp: Int = 1

func check() {
    for i in 0..<input.count {
        let str: String = input[i]
        
        if str == "(" {
            temp *= 2
            stack.append(str)
        } else if str == ")" {
            if let last = stack.last {
                if last != "(" {
                    print(0)
                    return
                } else {
                    // (
                    if input[i - 1] == "(" {
                        answer += temp
                    }
                    temp /= 2
                    stack.removeLast()
                }
            } else {
                print(0)
                return
            }
        } else if str == "[" {
            temp *= 3
            stack.append(str)
        } else if str == "]" {
            if let last = stack.last {
                if last != "[" {
                    print(0)
                    return
                } else {
                    if input[i - 1] == "[" {
                        answer += temp
                    }
                    temp /= 3
                    stack.removeLast()
                }
            } else {
                print(0)
                return
            }
        }
    }
    if !stack.isEmpty {
        print(0)
        return
    }
    
    print(answer)
}

check()

// (()[[]])([])
// 답: 28

// [][]((])
// 답: 0
