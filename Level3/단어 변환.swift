import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // begin 에서 target 으로 변환하는 가장 적은 횟수 구하기.
    // 하나의 알파벳만 변환. words 에 있는 단어로만 변환 가능.
    
    // words 에는 50개 이하의 단어. 50회가 바꿀 수 있는 최소 횟수.
    
    var visited: [Bool] = Array(repeating: false, count: words.count)
    var queue: [String] = []
    var count: Int = 0
    
    if !words.contains(target) {
        return 0
    }
    
    /// begin 에서 target 으로 변환 가능한지 여부.
    func isChangable(_ begin: String, with target: String) -> Bool {
        let begin: [String] = begin.map { String($0) }
        let target: [String] = target.map { String($0) }
        var count = 0
        
        for index in 0..<begin.count {
            if begin[index] == target[index] {
                count += 1
            }
        }
        
        return count == target.count - 1 ? true : false
    }

    // bfs(너비탐색) 사용
    
    queue.append(begin)
    
    while !queue.isEmpty {
        let word: String = queue.removeFirst()
        
        if target == word {
            break
        }
        
        count += 1
        for index in 0..<words.count {
            if isChangable(word, with: words[index]) && !visited[index] {
                queue.append(words[index])
                visited[index] = true
            }
        }
    }
    
    
    // 변환할 수 없는 경우는 0 반환.
    return count
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
// 4

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"]))
//0

//import Foundation
//
//enum PastaTaste: CaseIterable {
//    case cream, tomato
//}
//
//enum PizzaDough: CaseIterable {
//    case cheeseCrust, thin, original
//}
//
//enum PizzaTopping: CaseIterable {
//    case pepperoni, cheese, bacon
//}
//
//enum MainDish: CaseIterable {
//    case pasta(taste: PastaTaste)
//    case pizza(dough: PizzaDough, topping: PizzaTopping)
//    // 파라미터로 enum 이 아닌 경우
//    case chiken(withSauce: Bool)
//    // 파라미터가 없는 경우
//    case rice
//
//    static var allCases: [MainDish] {
//        return PastaTaste.allCases.map(MainDish.pasta)
//        + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in
//            result + PizzaTopping.allCases.map { topping -> MainDish in
//                MainDish.pizza(dough: dough, topping: topping)
//            }
//        }
//        + [true, false].map(MainDish.chiken)
//        + [MainDish.rice]
//    }
//}
//
//print(MainDish.allCases)
