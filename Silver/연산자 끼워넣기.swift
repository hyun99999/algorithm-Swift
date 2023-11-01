// 수열과 N-1개의 연산자 주어짐. +, -, *, /
// 우선 순위 무시하고 앞에서 진행.
// 결과가 최대인 것과 최소인 것을 구하시오.

let n: Int = Int(readLine()!) ?? 0
/// 100이하.
let a: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
// +, -, * /
let operators: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

// dfs 를 사용해서 최대, 최솟값 구하기.
// 백트래킹

/// 음수도 고려.
var maxSum: Int = Int.min
var minSum: Int = Int.max

func dfs(plus: Int, minus: Int, multiply: Int, divide: Int, result: Int, depth: Int) {
    if depth == a.count {
        // 종료 조건.
        maxSum = max(maxSum, result)
        minSum = min(minSum, result)
        
        return
    }

    if plus != 0  {
        dfs(plus: plus - 1, minus: minus, multiply: multiply, divide: divide, result: result + a[depth], depth: depth + 1)
    }

    if minus != 0  {
        dfs(plus: plus, minus: minus - 1, multiply: multiply, divide: divide, result: result - a[depth], depth: depth + 1)
    }

    if multiply != 0  {
        dfs(plus: plus, minus: minus, multiply: multiply - 1, divide: divide, result: result * a[depth], depth: depth + 1)
    }
    
    if divide != 0  {
        dfs(plus: plus, minus: minus, multiply: multiply, divide: divide - 1, result: result / a[depth], depth: depth + 1)
    }
}

dfs(plus: operators[0], minus: operators[1], multiply: operators[2], divide: operators[3], result: a[0], depth: 1)

print(maxSum)
print(minSum)

/*
2
5 6
0 0 1 0
*/

// 답: 30
// 30
