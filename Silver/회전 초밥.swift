import Foundation

// 초밥의 종류를 번호로 표현
// 벨트 위에는 같은 종류의 초밥이 없다.
// 1번 행사 : 벨트의 임의의 위치부터 k개의 접시를 연속으로 먹으면 할인된 가격으로 제공.
// 2번 행사 : 1번 행사에 참가할 경우 쿠폰에 적힌 종류의 초밥 하나를 추가로 무료 제공. 벨트위에 없다면 만들어서 손님에게 제공.
// 손님이 먹을 수 있는 초밥 가짓수의 최댓값은?

// 아이디어: k개의 접시를 연속으로 먹기 + 쿠폰에 적힌 초밥 먹기 를 구해야 최댓값이 될 수 있다.
// 회전 초밥이기 때문에 순환.

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }

/// 회전 초밥 벨트에 놓인 접시의 수.
let n: Int = input[0]
/// 초밥의 가짓수.
let d: Int = input[1]
/// 연속해서 먹는 접시의 수.
let k: Int = input[2]
/// 쿠폰 번호.
let c: Int = input[3]

var array: [Int] = []
for _ in 0..<n {
    array.append(Int(readLine()!) ?? 0 )
}

// 시간 초과 - Set 을 사용하여 매번 중복 유무를 판단하여 넣기 때문이라고 판단.
//var types: Set<Int> = []
var types: [Int : Int] = [:]
var answer: Int = 0

// 0부터 k-1까지 초밥 가짓수 초기화.
for i in 0..<k {
    types[array[i], default: 0] += 1
}
answer = types.count

for i in 0..<n - 1 {
    if types[array[i]] == 1 {
       types[array[i]] = nil
    } else {
        types[array[i], default: 0] -= 1
    }
    
    let end: Int = (i + k) % n
    types[array[end], default: 0] += 1
    
    if types[c] == nil {
        answer = max(answer, types.count + 1)
    } else {
        answer = max(answer, types.count)
    }
}

print(answer)
