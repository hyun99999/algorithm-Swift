import Foundation

// 민겸 수
// 10의 n제곱꼴은 N+1개의 M.
// 5*10의 n제곱꼴은 M 뒤에 1개의 K.
// 한 개이상의 민겸숫자를 이어붙여 민겸수를 만들 수 있다.
// MKKMMK 에 대해서 다양한 십진수로 변환될 수 있다.
// 이때 최댓값과 최솟값을 구해보자.

let numbers: [String] = readLine()!.map { String($0) }

// 아이디어 : K제외하고 M끼리 묶으면 0이 많아짐 -> 최솟값.
// K포함하여 끊으면 최댓값.

var min: String = ""
var max: String = ""
var mCount: Int = 0

for index in 0..<numbers.count {
    if numbers[index] == "M" {
        mCount += 1
    } else {
        // "K"
        if mCount > 0 {
            min.append("\(pow(10, mCount) + 5)")
            max.append("\(pow(10, mCount) * 5)")
        } else {
            min.append("5")
            max.append("5")
        }
        
        mCount = 0
    }
}

if mCount > 0 {
    min.append("\(pow(10, mCount - 1))")
    max.append(String(repeating:"1", count: mCount))
}

print(max)
print(min)

/*
MKM
*/

// 501
// 151
