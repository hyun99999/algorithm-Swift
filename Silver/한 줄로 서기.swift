// n명의 사람들은 매일 한 줄로 선다.
// 자기보다 큰 사람이 왼쪽에 몇 명 있는지만 기억함.
// 모두가 키가 다르다.

/// 사람의 수. 10이하.
let n: Int = Int(readLine()!) ?? 0

// 키가 1-n 자기보다 큰 사람이 왼쪽에 몇명있는지 주어짐.
// 줄을 선 순서대로 키를 출력하시오.
let height: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var answer: [Int] = Array(repeating: 0, count: height.count)

for i in 0..<height.count {
    var count: Int = 0
    
    // 키가 작은 1부터 자신보다 큰 사람만큼 공백을 남겨둔다.
    for j in 0..<answer.count {
        if count == height[i] && answer[j] == 0 {
            answer[j] = i + 1
            break
        } else {
            if answer[j] == 0 {
                count += 1
            }
        }
    }
}

print(answer.map { String($0)}.joined(separator: " ") )

/*
 4
 2 1 1 0
 */

// 4 2 1 3
