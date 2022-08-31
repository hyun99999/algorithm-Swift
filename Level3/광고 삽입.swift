import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    // 시청자들이 가장 많이 보는 구간에 공익광고 넣기.
    // play_time : 죠르디의 동영상 재생시간
    // adv_time : 광고 시간길이
    let playTime: Int = changeToSecond(play_time)
    let advTime: Int = changeToSecond(adv_time)
    
    // 파라미터 logs 원소는 H1:M1:S1-H2:M2:S2.
    let logs: [[Int]] = logs.map { $0.components(separatedBy: "-").map { changeToSecond($0)} }
    var timeline: [Int] = Array(repeating: 0, count: playTime + 1)
    
    if playTime == advTime {
        return "00:00:00"
    }
    
    for index in 0..<logs.count {
        // 시작하는 시간에는 시청구간이 추가되고,
        // 끝나는 시간에는 시청구간이 삭제.
        timeline[logs[index][0]] += 1
        timeline[logs[index][1]] -= 1
        
        // timeline 은 매초마다 시청이 시작된 횟수를 알 수 있음.(아직 시청중인 횟수는 알지 못함)
    }
    
    // 시청 중인 횟수도 추가해보자.
    // ✅ 아이디어 : 바로 전 timline 을 더해주면 알아서 이전에 끝나는 시간에 마이너스 된 값들이 계산된다.
    for index in 1..<timeline.count {
        timeline[index] += timeline[index - 1]
    }
    // 결국, timeline 은 매초마다 시청자 숫자만큼의 값을 갖게 됨.
    // 이중 광고 시간길이 동안 가장 많은 값을 가지는 가장 빠른 구간을 찾으면 됨.
    
    // ✅ 아이디어 : 이전값을 누적시켜서 어느 구간이 가장 시청자가 많은지 확인할 수 있다.
    // 위의 반복문 그대로 반복.
    // timeline : 00:00:00 부터 index + 1 까지 index + 1 초 간의 구간에 대한 누적 시청자
    for index in 1..<timeline.count {
        timeline[index] += timeline[index - 1]
    }
    
    // advTime 만큼의 구간에 대한 누적 시청자 수
    // -> timeline[index] - timeline[index - advTime]
    var max: Int = 0
    /// 가장 많은 누적 재생 시작 시간(초 단위)
    var maxTime: Int = 0
    
    for index in (advTime - 1)..<playTime {
        if index >= advTime {
            if timeline[index] - timeline[index - advTime] > max {
                max = timeline[index] - timeline[index - advTime]
                maxTime = index
            }
        } else {
            // advTime - 1. 즉, 0 부터 advTime 간의 구간에 대한 누적 시청자.
            max = timeline[index]
            maxTime = index
        }
    }
    
    // 시작 시간을 구해서 반환. HH:MM:SS
    // 누적된 시청자가 가장 많은 시간 - 광고시간
    return changeToTime(maxTime - advTime + 1)
}

/// 초 단위로 시간을 변환.
func changeToSecond(_ time: String) -> Int {
    let times: [Int] = time.components(separatedBy: ":").map { Int($0)! }
    
    return times[0] * 3600 + times[1] * 60 + times[2]
}

/// 초 단위를 시간으로 변환.
func changeToTime(_ seconds: Int) -> String {
    return "\(addZero(to: seconds / 3600)):\(addZero(to: seconds % 3600 / 60)):\(addZero(to: seconds % 60))"
}

/// 한 자릿수 시간에 0 추가
func addZero(to number: Int) -> String {
    return number < 10 ? "0\(number)" : "\(number)"
}

print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]))
// "01:30:59"

print(solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"]))
// "01:00:00"

print(solution("50:00:00", "50:00:00", ["15:36:51-38:21:49", "10:14:18-15:36:51", "38:21:49-42:51:45"]))
// "00:00:00"
