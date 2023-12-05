// 학생들은 k개의 글자로만 이루어진 단어만 읽을 수 있다
// 어떤 k개의 글자를 가르쳐야 단어의 개수가 최대가 되는가?
// 단어는 anta 로 시작되고 tica 로 끝난다.
// 단어는 n개만 있다 읽을 수 있는 단어의 최댓값은?

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var alphabet: Int = 0
// n <= 50
var wordsBit: [Int] = Array(repeating: 0, count: 50)
var maxCount: Int = 0

for i in 0..<nk[0] {
    let input: [String] = readLine()!.map { String($0) }

    // 후보가 될 수 있는 알파벳을 가지고 완전 탐색
    // 시간 초과를 해결하기 위해서 비트 마스킹
    
    for j in input {
        wordsBit[i] |= 1 << (Int(Character(j).asciiValue! - Character("a").asciiValue!))
    }
}

func dfs(depth: Int, start: Int) {
    var count: Int = 0
    
    if depth == nk[1] - 5 {
        for i in 0..<nk[0] {
            if wordsBit[i] & alphabet == wordsBit[i] {
                count += 1
            }
        }
        
        maxCount = max(maxCount, count)
        return
    }
    
    // 알파벳은 26개
    for i in start...25 {
        if (alphabet & (1 << i)) == 0 {
            alphabet |= (1 << i)
            dfs(depth: depth + 1, start: i)
            alphabet &= ~(1 << i)
        }
    }
}

if nk[1] < 5 {
    print(0)
} else {
    alphabet |= 1 << (Int(Character("a").asciiValue! - Character("a").asciiValue!))
    alphabet |= 1 << (Int(Character("n").asciiValue! - Character("a").asciiValue!))
    alphabet |= 1 << (Int(Character("t").asciiValue! - Character("a").asciiValue!))
    alphabet |= 1 << (Int(Character("i").asciiValue! - Character("a").asciiValue!))
    alphabet |= 1 << (Int(Character("c").asciiValue! - Character("a").asciiValue!))
    
    dfs(depth: 0, start: 0)
    
    print(maxCount)
}

// 참고 : https://sapjilkingios.tistory.com/entry/Swift비트마스킹-백준-1062번-가르침

/*
3 6
antarctica
antahellotica
antacartica
*/

// 2
