import Foundation

// 절대값이 10배수인 버튼 존재. 버튼을 누르면 층 수에 더한 층으로 이동.
// 단, 합이 0보다 작으면 엘리베이터는 움직이지 않는다.
// 버튼 한 번당 마법의 돌 한 개 사용.
// 최소한의 버튼을 눌러서 이동하려고 한다. 0층올 내려가는데 필요한 최소 개수는?
func solution(_ storey:Int) -> Int {
    // 아이디어: 일의 자리수부터 반올림 진행.
    // ✅ 5일때 앞자리가 5이면 내림보다 올림이 최소다.
    var storey: Int = storey
    /// 사용되는 마법의 돌의 개수.
    var answer: Int = 0

    while storey != 0 {
        let number: Int = storey % 10
        
        if number == 5 {
            if (storey / 10) % 10 >= 5 {
                // 앞자리가 5이상 경우는 올림.
                answer += 10 - number
                storey += 10
            } else {
                // 앞자리가 5미만 경우는 내림.
                answer += number
            }
        } else if number > 5 {
            answer += 10 - number
            storey += 10
        } else {
            answer += number
        }
        
        storey /= 10
    }
    
    return answer
}

print(solution(2554))
// 16
print(solution(555))
// 14
