// 2N 길이의 벨트가 컨베이어 벨트를 위아래로 감싸고 있다.
// 회전하면 1번부터 2N-1번까지는 다음 번호로 이동, 2N번은 1번으로 이동.
// 1번 올리는 위치. N번 내리는 위치.
// 로봇이 올라가거나 이동하면 그 칸의 내구도는 1감소

// 다음의 단계가 있다.
//
// 1. 로봇이 한 칸 이동한다.
// 2. 로봇이 이동할 수 없다면 가만히 있는다.
//    로봇이 이동하기 위해 이동하려는 칸에 로봇이 없어야 한다. 1이상 내구도가 남아야 한다.
// 3. 올리는 위치의 내구도가 0이 아니면 로봇은 올라간다.
// 4. 내구도가 0인 칸이 K개 이상이면 종료.
// 종료되었을 때 몇번째 단계인지 구하시오.

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
var a: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

/// 단계
var stage: Int = 0

/// 벨트에 올라간 로봇의 유무
var robots = Array(repeating: false, count: nk[0])

while true  {
    stage += 1
    
    // 1. 로봇과 벨트가 함께 회전.
    robots.removeLast()
    robots.insert(false, at: 0)
    // 언제든 로봇은 내리는 위치에서 내림
    robots[nk[0] - 1] = false
    
    let last: Int = a.removeLast()
    a.insert(last, at: 0)

    // 2. 로봇 이동
    for i in (0..<robots.count - 1).reversed() {
        if robots[i] {
            // 로봇이 있음
            if !robots[i + 1] {
                // 이동 칸에 로봇 없음
                if a[i + 1] >= 1 {
                    // 이동 칸에 내구도 1 이상
                    // 이동 가능
                    a[i + 1] -= 1
                    robots[i] = false
                    robots[i + 1] = true
                }
            }
        }
    }
    // 언제든 로봇은 내리는 위치에서 내림
    robots[nk[0] - 1] = false
    
    // 3. 로봇을 올린다.
    if !robots[0] && a[0] >= 1 {
        robots[0] = true
        a[0] -= 1
    }
    
    // 4. 내구도 0 칸이 k개 이상이면 종료
    /// 내구도가 0인 칸의 개수
    var zero: Int = 0
    
    for i in 0..<a.count {
        if a[i] <= 0 {
            zero += 1
        }
    }
    
    if zero >= nk[1] {
        break
    }
}

print(stage)

/*
3 2
1 2 1 2 1 2
*/

// 2

/*
3 6
10 10 10 10 10 10
*/

// 31
