func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    // 0부터 숫자 시작.
    // 아이디어 : 숫자 (p(튜브의 순서) - 1) 부터 m(게임인원)만큼의 간격을 가지고 다음 숫자를 구함. -> stride(from:to:by) 사용.
    
    /// n진수로 변환할 숫자.
    var number: Int = 0
    
    // m * t 개의 n진수의 한자리씩 가지는 배열.
    var values: [String] = []
    
    while values.count < m * t {
        values.append(contentsOf: String(number, radix: n, uppercase: true).map { String($0) })
        number += 1
    }
    
    // through : 파라미터까지
//    return stride(from: p - 1, through: m * t - 1, by: m).reduce("") { $0 + values[$1]}
    // to : 파라미터 - 1 까지
        return stride(from: p - 1, to: m * t, by: m).reduce("") { $0 + values[$1]}
}

print(solution(2, 4, 2, 1))
// "0111"

print(solution(16, 16, 2, 2))
// "13579BDF01234567"
