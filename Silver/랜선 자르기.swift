// 영식은 k개의 랜선을 가졌다. 랜선의 길이는 제각각이다.
// 성원은 랜선을 모두 n개의 같은 길이로 만들고 싶다.
// k개의 랜선을 잘라서 만들어야 한다.
// n개보다 많이 만ㄷ르어도 된다.
// 이때 만들 수 있는 최대 랜선의 길이를 구하시오.

let kn: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var k: [Int] = []

for _ in 0..<kn[0] {
    let input: Int = Int(readLine()!) ?? 0
    
    k.append(input)
}

var right: Int = k.max()!
var left: Int = 1

// 0 부터 최대값까지 이진탐색.
var maximum: Int = 0

while left <= right {
    let mid: Int = (right + left) / 2
    let count: Int = k.map { $0 / mid }.reduce(0, +)
    
    if count < kn[1] {
        right = mid - 1
    } else {
        left = mid + 1
        maximum = max(maximum, mid)
    }
}

print(maximum)

/*
4 11
802
743
457
539
*/

// 200
