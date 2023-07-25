// 피보나치 함수에서 반환될 때 0과 1이 각각 몇 번씩 호출되는지 구하시오.

let t: Int = Int(readLine()!) ?? 0

// 시간제한이 0.25초 이기 때문에 시간초과를 우려한 dp.

// 0 <= n <= 40
var zeroDP: [Int] = Array(repeating: 0, count: 41)
var oneDP: [Int] = Array(repeating: 0, count: 41)

zeroDP[0] = 1
zeroDP[1] = 0
zeroDP[2] = 1

oneDP[0] = 0
oneDP[1] = 1
oneDP[2] = 1

for i in 3...40 {
    zeroDP[i] = zeroDP[i - 2] + zeroDP[i - 1]
    oneDP[i] = oneDP[i - 2] + oneDP[i - 1]
}

var zeroAnswer: [Int] = []
var oneAnswer: [Int] = []

for _ in 0..<t {
    let input:Int = Int(readLine()!) ?? 0
    
    zeroAnswer.append(zeroDP[input])
    oneAnswer.append(oneDP[input])
}

for i in 0..<t {
    print(zeroAnswer[i], oneAnswer[i])
}

/*
 3
 0
 1
 3
 */

/*
 1 0
 0 1
 1 2
 */
