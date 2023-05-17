// 카드는 8가지가 있다.
// 카드 n개가 포함된 카드팩과 같이 총 n가지가 존재.
// 민규는 돈을 최대한 많이 지불해서 카드 n개를 구매하려고 한다.
// n개의 카드를 구매하는데 민규가 지불해야하는 금액의 최댓값은?

let n: Int = Int(readLine()!) ?? 0
let p: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0}

// DP
var array: [Int] = Array(repeating: 0, count: n + 1)

for index in 0..<p.count {
    array[index + 1] = p[index]
}

// 2
// 1 + 2-1, array[2] 비교

// 3
// 1 + 3-1, array[3] 비교

// 4
// 1 + 4-1, array[4]
// 2 + 4-2, arra[4]

for i in 2...n {
    for j in 1...(i / 2) {
        array[i] = max(array[j] + array[i - j], array[i])
    }
}

print(array[n])
