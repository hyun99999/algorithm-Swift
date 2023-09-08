import Foundation

// 시작시간이 되면 과제 시작.
// 진행 중인 과제가 있다면 멈추고 새로운 과제 시작
// 진행 중인 과제가 끝나면 멈춘 과제 시작.
// 이때, 새로 시작하는 과제도 있다면 우선시한다.
// 멈춰둔 과제가 여러개일 경우, 가장 최근에 멈춘 과제부터 시작.

// 과제를 끝낸 순서대로 이름을 배열에 담아 반환.

func timeToMinutes(_ time: String) -> Int {
    let times: [Int] = time.split(separator: ":").map { Int($0) ?? 0 }
    
    return times[0] * 60 + times[1]
}

func solution(_ plans:[[String]]) -> [String] {
    let plans: [[String]] = plans.sorted { $0[1] < $1[1] }
    
    var stack: [(subject: String, time: Int)] = []
    var answer: [String] = []
    var leftTime: Int = 0
    
    for i in 0..<plans.count {
        while !stack.isEmpty {
            let last: (subject: String, time: Int) = stack.removeLast()
            
            if leftTime >= last.time {
                leftTime -= last.time
                answer.append(last.subject)
            } else {
                stack.append((last.subject, last.time - leftTime))
                break
            }
        }
        
        stack.append((plans[i][0], Int(plans[i][2])!))
        
        if i < plans.count - 1 {
            leftTime = timeToMinutes(plans[i + 1][1]) - timeToMinutes(plans[i][1])
        }
    }
    
    // 남은 과제 마무리.
    return answer + stack.map { $0.subject }.reversed()
}

//print(solution([["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]]))
// ["korean", "english", "math"]

//print(solution([["science", "12:40", "50"], ["music", "12:20", "40"], ["history", "14:00", "30"], ["computer", "12:30", "100"]]))
// ["science", "history", "computer", "music"]

print(solution([["aaa", "12:00", "20"], ["bbb", "12:10", "30"], ["ccc", "12:40", "10"]]))
// ["bbb", "ccc", "aaa"]
