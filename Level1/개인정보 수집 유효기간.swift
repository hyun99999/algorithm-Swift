import Foundation

    // 개인 정보 n개. 각각 유효기간 존재.
    // 유효기간이 지나면 파기.

    // 모든 달은 28일
    // 번호는 1번 부터 시작.
func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    let privacies: [[String]] = privacies.map { $0.components(separatedBy: " ")}
    var termsDictionary: [String : Int] = [:]
    var answer: [Int] = []
    
    /// date 가 파기해야할 개인정보인지 확인
    func isExpireable(_ date: String, _ terms: Int) -> Bool {
        let today: [Int] = today.components(separatedBy: ".").map { Int($0) ?? 0 }
        let dates: [Int] = date.components(separatedBy: ".").map { Int($0) ?? 0 }
        
        let todayDay: Int = today[0] * 12 * 28 + today[1] * 28 + today[2]
        let datesDay: Int = dates[0] * 12 * 28 + dates[1] * 28 + dates[2]
        
        return todayDay > datesDay + terms * 28 - 1 ? true : false
    }
    
    // 약관 종류에 따른 유효기간.
    for term in terms {
        let terms: [String] = term.components(separatedBy: " ")
        
        termsDictionary[terms[0]] = Int(terms[1]) ?? 0
    }
    
    // 개인정보 수집 일자에 따른 파기 여부
    for index in 0..<privacies.count {
        if isExpireable(privacies[index][0], termsDictionary[privacies[index][1]] ?? 0) {
            answer.append(index + 1)
        }
    }

    // 오늘 날짜로 파기해야할 개인정보 번호를 오름차순으로 반환.
    return answer.sorted()
}
