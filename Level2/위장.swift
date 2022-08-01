import Foundation

// 스파이가 가진 의상은 1개 이상 30개 이하
// 스파이는 하루에 최소 한 개의 의상을 입는다.
// [의상의 이름, 의상의 종류]
func solution(_ clothes:[[String]]) -> Int {
    var categories: [String] = []
    var clothesCategories: [String: [String]] = [:]
    var answer: Int = 1
    
    // categories 와 clothesCategories 초기화.
    for clothes in clothes {
        if clothesCategories[clothes[1]] != nil {
            clothesCategories[clothes[1]]!.append(clothes[0])
        } else {
            categories.append(clothes[1])
            clothesCategories[clothes[1]] = [clothes[0]]
        }
    }

    for category in categories {
        // 안 입는 경우도 추가.
        answer *= (clothesCategories[category]!.count + 1)
    }
    
    // 모두 안입는 경우 한 가지 제외.
    return answer - 1
}

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
// 5
