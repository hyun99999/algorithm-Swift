import Foundation

// 초콜릿은 막대 모양. 정사각형 n개로 이루어져 있다.
// 정사각형의 개수는 항상 2의 제곱 형태이다.
// 상근이는 점심식사로 적어도 k개의 정사각형을 먹어야 남은 수업을 버틸 수 있다.
// 막대 초콜릿은 항상 가운데로만 쪼개진다.
// k개의 정사각형을 만들기 위해 초콜릿을 최소 몇번 쪼개야 하는지? 사야하는 최소 개수의 초콜릿의 크기는?
// 상근이는 초콜릿 하나만 살 수 있다. 여러 조각에 있는 정사각형을 합쳐서 k개가 되면 된다.

let k: Int = Int(readLine()!) ?? 0

// 아이디어: k 보다 작은 최대의 2의 제곱을 구한다. 이것이 구매하는 초콜릿의 반만큼이 된다.
// 그리고 초콜릿을 반으로 쪼개면서 k의 약수가 될때까지 진행.

/// 가장 작은 초콜릿의 크기.
var choco: Int = 1
/// 최소 쪼깨는 횟수.
var count: Int = 0

while choco < k {
    choco *= 2
}

print(choco, terminator: " ")

while true {
    if k % choco == 0 {
        break
    } else {
        choco /= 2
        count += 1
    }
}

print(count)

/*
6

결과
8
2
*/
