import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var menuSet = [String : Int]()
    var result = [String]()
    
    // 메뉴마다 나올 수 있는 코스 조합
    func combination(origin: [Character], n: Int, resultString: String) {
        // ✅ 모든 조합 고려 시 한 개의 조합은 배제.
        if resultString.count > 1 &&  course.contains(resultString.count) {
            if menuSet.keys.contains(resultString) {
                menuSet[resultString]! += 1
            } else {
                menuSet[resultString] = 1
            }
        }
        
        // ✅ 다음 조합 생성
        for i in n+1..<origin.count {
            combination(origin: origin, n: i, resultString: "\(resultString)\(origin[i])")
        }
        
    }

    for order in orders {
        // ✅ 문자열 문자배열로 변환.
//        let menus: [Character] = order.map { $0 }.sorted()
        
        // 위의 코드와 같은 기능을 한다. 왜냐면 sorted() 는 element 의 순서로 정렬해서 배열로 반환하니까
        let menus = order.sorted()
        for i in menus.indices {
            combination(origin: menus, n: i, resultString: "\(menus[i])")
        }
    }
    // ✅ 가장 많이 주문된 메뉴 조합
    for n in course {
        // $0.value > 1 : 최소 두명이상 조합만 후보에 포함조건
        // max 의 의미 : 중복이 되든 안되든 최고값을 가지는 딕셔너리.
        let max = menuSet.filter { $0.key.count == n && $0.value > 1 }.max { $0.value < $1.value }
        if let max = max {
            menuSet.filter { $0.key.count == n }.forEach {
                // 최고값과 menuSet 의 value 비교.
                if $0.value == max.value {
                    result.append($0.key)
                }
            }
        }
    }

    return result.sorted()
}

//**조건**
// - 코스요리 메뉴는 최소 2가지 이상의 단품메뉴 구성
// - 최소 2명 이상의 손님으로부터 주문된 단품메뉴 조합만 후보에 포함


    
solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
solution(["XYZ", "XWY", "WXA"], [2,3,4])
