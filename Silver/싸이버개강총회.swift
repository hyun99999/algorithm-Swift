// 다음과 같이 출석부를 관리하기로 한다.

// 1.개강총회를 시작하기 전에, 입장 확인.
// -> 개강총회 시작 시간 포함 이전에 대화를 한 적이 있는 닉네임 체크.

// 2. 개강총회를 끝내고 나서, 스트리밍을 끝낼 떄까지. 퇴장 확인.
// -> 개강총회가 끝날때. 스트리밍이 끝날 때까지. 대화를 한 적이 있는 닉네임을 보고 체크.

func timeToMinutes(_ time: String) -> Int {
    let times: [Int] = time.split(separator: ":").map { Int($0) ?? 0 }
    
    return times[0] * 60 + times[1]
}

let input: [String] = readLine()!.split(separator: " ").map { String($0) }
let start: Int = timeToMinutes(input[0])
let end: Int = timeToMinutes(input[1])
let streamingEnd: Int = timeToMinutes(input[2])

var users: [String: Bool] = [:]

while let timestamp: [String] = readLine()?.split(separator: " ").map({ String($0) }) {
    let time: Int = timeToMinutes(timestamp[0])
    let nickname: String = timestamp[1]
    
    if 0 <= time && time <= start {
        // 출석.
        users[nickname] = true
    } else if end <= time && time <= streamingEnd {
        // 퇴장.
        if users[nickname] != nil {
            users[nickname] = false
        }
    }
}

print(users.filter { $0.value == false }.count)

/*
22:00 23:00 23:30
21:30 malkoring
21:33 tolelom
21:34 minjae705
21:35 hhan14
21:36 dicohy27
21:40 906bc
23:00 906bc
23:01 tolelom
23:10 minjae705
23:11 hhan14
23:20 dicohy27
*/

// 답: 5
