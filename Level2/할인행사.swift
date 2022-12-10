import Foundation

// 10일 동안 회원 자격을 부여함. 15일간 할인 제품을 판매.
// discount 배열에 매일의 할인 제품이 담김.
// 원하는 제품을 모두 할인 받을 수 있는 회원등록 일자는 총 몇일인가?
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var list: [String : Int] = [:]
    var answer: Int = 0
    
    for index in 0..<want.count {
        list[want[index]] = number[index]
    }
    
    for index in 0...discount.count - 10 {
        var newList: [String : Int] = list
        
        for j in index..<index + 10 {
            if newList[discount[j]] != nil {
                if newList[discount[j]] == 1 {
                    newList[discount[j]] = nil
                } else {
                    newList[discount[j]]! -= 1
                }
            }
            
            if newList.isEmpty {
                answer += 1
                break
            }
        }
    }
    
    
    return answer
}

print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
// 3
