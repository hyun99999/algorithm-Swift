import Foundation

func solution(_ s:String) -> String {
    // 정렬하여 first, last 사용
    
//    let s: [String.SubSequence] = s.split(separator: " ")
    // components 를 사용하게 되면 Foundation 을 import 해주어야 합니다.
    // split 좀 더 많은 인자를 사용할 수 있다.
    let s: [String] = s.components(separatedBy: " ")
    // 정수 배열로 바꾸지 않으면 "-1" 은 "-4" 보다 작다.
    let intArray: [Int] = s.map { Int($0)! }
    
    // min, max 메서드 사용
    return "\(intArray.min()!) \(intArray.max()!)"
}

print(solution("1 2 3 4"))
// "1 4"

print(solution("-1 -2 -3 -4"))
// "-4 -1"
