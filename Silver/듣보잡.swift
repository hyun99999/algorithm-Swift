// 들어보지 못한 명단과
// 보지 못한 명단이 주어질 때
// 듣지도 보지도 못한 명단을 작성하시오.

/// n 과 m 500,000 이하.
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var dontHeared: [String : Bool] = [:]
var dontSaw: [String : Bool] = [:]

for _ in 0..<nm[0] {
    let input: String = readLine()!
    
    dontHeared[input, default: true] = true
}

for _ in 0..<nm[1] {
    let input: String = readLine()!
    
    dontSaw[input, default: true] = true
}

// 2중 for 문을 사용하면 시간초과 예상.
// 딕셔너리 사용.

var answer: [String] = []

for (name, _) in dontHeared {
    if dontSaw[name] != nil {
        answer.append(name)
    }
}

print(answer.count)

// 사전순으로 출력.
answer.sorted().forEach { print($0) }

/*
 3 4
 ohhenrie
 charlie
 baesangwook
 obama
 baesangwook
 ohhenrie
 clinton
 */


/*
 2
 baesangwook
 ohhenrie
 */
