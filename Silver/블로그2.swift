import Foundation

// 아침에 문제를 정하고 매일 밤 각각 문제에 대해 칠한다.

// 연속된 임의의 문제들을 선택.
// 선택한 문제들을 같은 색으로 칠한다.
// 해결한 경우, 파랑. 해결하지 못한 경우, 빨강(중복해서 칠하는 것이 가능.)

// 문제를 칠할때 필요한 최소한의 작업 횟수는?

let n: Int = Int(readLine()!)!
var dictionary: [String : Int] = [:]
let questions: [Character] = readLine()!.map { $0 }
// 아이디어: 가장 많은 색으로(B or R) 다 칠한다. 연속되면 칠하는 횟수를 올리지 않는다.

var preColor: String = ""

for index in 0..<n {
    if questions[index] == "B" && preColor != "B" {
        dictionary["B", default: 0] += 1
        preColor = "B"
    } else if questions[index] == "R" && preColor != "R"{
        // R
        dictionary["R", default: 0] += 1
        preColor = "R"
    }
}

// 더 작은 색상으로 칠한다. + 다른 색상으로 한번에 칠함.(+1)
print(min(dictionary["B"] ?? 0, dictionary["R"] ?? 0) + 1)
