import Foundation

func timeToMinutes(_ time: String) -> Int {
    let times: [Int] = time.split(separator: ":").map { Int($0) ?? 0 }
    return times[0] * 60 + times[1]
}

// 최소한의 객실을 사용하여 예약 손님을 받으려 한다.
// 한 번 사용한 객실은 퇴실 시간을 기준으로 10분간 청소 후에 사용 가능.

/// boot_time <= 1,000
func solution(_ book_time:[[String]]) -> Int {
    var answer: Int = 0
    /// 퇴실시간을 기록한 배열
    var book: [Int] = Array(repeating: 0, count: 1000)
    var bookTime: [[Int]] = []
    
    for i in 0..<book_time.count {
        let times: [Int] = [timeToMinutes(book_time[i][0]), timeToMinutes(book_time[i][1])]
        
        bookTime.append(times)
    }
    
    // 입실시간을 기준으로 정렬.
    bookTime.sort { $0[0] < $1[0] }
    
    // O(n^2)
    for i in 0..<bookTime.count {
        for j in 0..<book.count {
            if book[j] == 0 {
                answer += 1
                book[j] = bookTime[i][1]
                break
            }
            
            if book[j] + 10 > bookTime[i][0] {
                continue
            } else {
                book[j] = bookTime[i][1]
                break
            }
        }
    }
    
    return answer
}
