import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    // 09:00 부터 n 회 t 분 간격으로 역에 도착.
    // 최대 m 명 탑승.
    // 콘이 사무실에 도착하는 제일 늦은 시간 구하기. 콘은 같은 시간의 가장 맨 끝에 대기한다.
    // timealbe 은 하루동안 크루가 대기열에 도착하는 시각 배열.
    var sortedTimetalbe: [Int] = timetable.map { changeToMinute($0) }.sorted(by: <)
    /// 현재 버스의 탑승객 시간 배열.
    var bus: [Int] = []
    let firstTime: Int = 9 * 60

    // ✅ 아이디어 : 마지막에 탈 버스에 대한 정보만 알면된다.
    for i in 0..<n {
        bus = []
        for _ in 0..<sortedTimetalbe.count {
            if firstTime + i * t >= sortedTimetalbe.first! && bus.count < m {
                let first: Int = sortedTimetalbe.removeFirst()
                bus.append(first)
            } else { break }
        }
    }
    
    if bus.count < m {
        // 마지막 버스에 혼자 탑승 또는 마지막 대기열로 탑승 가능하면 -> 정각에 탑승하면 됨.
        return changeToTime(firstTime + (n - 1) * t)
    } else {
        // 마지막 버스에 타는 마지막 사람 - 1 분 전에 탑승하면 됨.
        return changeToTime(bus.last! - 1)
    }
}

func changeToMinute(_ time: String) -> Int {
    let times: [String] = time.components(separatedBy: ":")
    
    return Int(times[0])! * 60 + Int(times[1])!
}

func changeToTime(_ time: Int) -> String {
    return "\(addZero(with: time / 60)):\(addZero(with: time % 60))"
}

func addZero(with number: Int) -> String {
    return number >= 10 ? "\(number)" : "0\(number)"
}

print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))
// "09:00"
