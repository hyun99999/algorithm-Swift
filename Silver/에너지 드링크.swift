import Foundation

// 임의의 서로 다른 두 에너지 드링크를 고른다.
// 한쪽에 다른쪽을 붓는다. 붓는 과정에서 붓는 양의 절반을 바닥에 흘림. 이때 선택이 가능함.
// 에너지 드링크가 하나 남을 때까지 반복.
// 에너지 드링크의 양을 최대로 한다면 그 양은?

let n: Int = Int(readLine()!) ?? 0
var drinks: [Double] = readLine()!.components(separatedBy: " ").map { Double($0) ?? 0 }

drinks.sort(by: >)

var answer: Double = drinks[0]

for index in 1..<drinks.count {
    answer += drinks[index] / 2
}

print(answer)

/*
입력:
z
*/

// 출력
// 20
