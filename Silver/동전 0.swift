// 동전은 총 N 종류
// 동전을 사용하여 가치의 합을 k로 만들려고 한다.
// 이때 필요한 동전 개수의 최솟값은?

let nk: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

var k: Int = nk[1]
var coin: [Int] = []
var answer: Int = 0

for _ in 0..<nk[0] {
    let a: Int = Int(readLine()!) ?? 0
    
    coin.append(a)
}

for i in (0..<coin.count).reversed() {
    answer += k / coin[i]
    k %= coin[i]
}

print(answer)

/*
10 4200
1
5
10
50
100
500
1000
5000
10000
50000
*/

// 6
