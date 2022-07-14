import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let weekdays = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let days: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    // 금요일 시작
    var day = 5
    
    for n in 0..<a-1 {
        day += days[n]
    }
    
    day += b - 1
    
    return weekdays[day % 7]
}
