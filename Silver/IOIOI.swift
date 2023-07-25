// n+1 개의 i와 n개의 o으로 이루어짐.
// i,o 교대로 나오는 문자열을 Pn이라고 함.

// i, o 로만 이루어진 문자열 s 와 정수 n 주어졌을 때, s안에 Pn 몇 군데 포함되어 있는가?

// P1 IOI
// P2 IOIOI
// P3 IOIOIOI
// PN IOIOI...OI (O가 N개)

let n: Int = Int(readLine()!) ?? 0
/// s 길이
let m: Int = Int(readLine()!) ?? 0
let s: [String] = readLine()!.map { String($0) }

var answer: Int = 0

// 각 문자열이 I 인 경우 n만큼 탐색
// dfs
// 🚨 부분 성공.(n <= 1,000,000 와 m <= 1,0000,000 일때, 통과하지 못함.)

/*
/// Pn 길이
let pn: Int = (n + 1) + n
 
func dfs(_ start: Int, count: Int, preString: String) {
    if count == pn && preString == "I" {
        answer += 1
        
        return
    }
    
    if preString == "I" && s[start] == "O" {
        dfs(start + 1, count: count + 1, preString: "O")
    }
    
    if preString == "O" && s[start] == "I" {
        dfs(start + 1, count: count + 1, preString: "I")
    }
}

for i in 0..<m {
    if s[i] == "I" && (i + pn - 1) < m {
        dfs(i + 1, count: 1, preString: "I")
    }
}
 */

// 🚨 통과하기 위해 O(N) 혹은 O(nlogn) 의 시간복잡도가 필요했음.
// -> 단일 for 문이 필요.

var index: Int = 0
var count: Int = 0

while (m - 2) > index {
    if s[index..<index + 3].joined() == "IOI" {
        index += 2
        count += 1
        
        if count == n {
            count -= 1
            answer += 1
        }
    } else {
        index += 1
        count = 0
    }
}

print(answer)

/*
 1
 13
 OOIOIOIOIIOII
 */


// 4
